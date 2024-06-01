import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/controllers/auths/auth_controller/auth_state.dart';
import 'package:smartpay/controllers/auths/auth_repo/auth_implementation.dart';
import 'package:smartpay/controllers/auths/auth_repo/auth_service.dart';
import 'package:smartpay/models/auth/signup_model.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/utils/secure_storage.dart';
import 'package:smartpay/utils/validate_mixin.dart';
import 'package:smartpay/views/auths/acc_created.dart';
import 'package:smartpay/views/auths/userdetails_view.dart';
import 'package:smartpay/views/auths/verify_email_view.dart';
import 'package:smartpay/views/home/home_view.dart';
import 'package:smartpay/widgets_utils/dialog_utils.dart';

final authController = StateNotifierProvider<AuthController, AuthState>(
    (ref) => AuthController(AUthImplementation()));

class AuthController extends StateNotifier<AuthState> with ValidationMixin {
  AuthController(this._authService) : super(AuthState.internal());
  final AuthService _authService;
  void onChangeFullname(String? value) {
    state = state.copyWith(fullName: value);
  }

  void onChangeUsername(String? value) {
    state = state.copyWith(username: value);
  }

  void onChangeSelectedCountryCode(Country value) {
    state = state.copyWith(country: value.countryCode);
  }

  void onChangeEmail(String? value) {
    state = state.copyWith(email: value);
  }

  void onChangePassword(String? value) {
    state = state.copyWith(password: value);
  }

  void onChangeOtp(String? value) {
    state = state.copyWith(otp: value);
  }

  void onChangePin(String? value) {
    state = state.copyWith(pin: value);
  }

  Future<String> getDeviceIdentifier() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceIdentifier = "";
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceIdentifier =
          '${androidInfo.model}-${androidInfo.brand}-${androidInfo.id}';
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceIdentifier = iosInfo.identifierForVendor!;
    }
    return deviceIdentifier;
  }

  Future<void> signUp() async {
    try {
      DialogUtils.showLoadingBar();
      String device = await getDeviceIdentifier();
      final signupModel = SignupModel(
          fullName: state.fullName,
          username: state.username,
          country: state.country,
          email: state.email,
          password: state.password,
          deviceName: device);
      await _authService.signUp(signupModel);
      SecureStorage.setIsFirstTimer = 'false';
      AppRoute.navKey.currentState?.pop();

      AppRoute.navKey.currentState?.pushNamed(VerifyEmailView.route,
          arguments: VerificationScreenEnum.setPin);
      // AppRoute.navKey.currentState?.pushNamed(AccCreated.route);
    } catch (e) {
      AppRoute.navKey.currentState?.pop();
      DialogUtils.showDialogNotification(message: e.toString());
      rethrow;
    }
  }

  Future<void> signIn() async {
    try {
      DialogUtils.showLoadingBar();
      String device = await getDeviceIdentifier();

      final res = await _authService.signIn(
          email: state.email, password: state.password, deviceId: device);

      state = state.copyWith(fullName: res.data?.user?.fullName);
      SecureStorage.setToken = res.data?.token ?? '';
      SecureStorage.setIsFirstTimer = 'false';
      AppRoute.navKey.currentState?.pop();

      AppRoute.navKey.currentState?.pushReplacementNamed(
        HomeView.route,
      );
    } catch (e) {
      AppRoute.navKey.currentState?.pop();
      DialogUtils.showDialogNotification(message: e.toString());
      rethrow;
    }
  }

  Future<void> initVerifyEmail() async {
    try {
      DialogUtils.showLoadingBar();
      final response = await _authService.initverifyEmail(state.email);
      AppRoute.navKey.currentState?.pop();
      DialogUtils.showDialogNotification(
          isError: false,
          title: 'This is your Email verification token',
          buttonText: "Copy Code",
          onpressed: () {
            Clipboard.setData(ClipboardData(text: response.data?.token ?? ''))
                .then((_) {
              ScaffoldMessenger.of(AppRoute.navKey.currentContext!)
                  .showSnackBar(const SnackBar(
                      content: Text('Copied to your clipboard !')));
            });
            AppRoute.navKey.currentState?.pushNamed(VerifyEmailView.route,
                arguments: VerificationScreenEnum.verifyEmail);
          },
          message:
              "Copy your verification token for \nverification on the Next Screen (${response.data?.token ?? ''})");
    } catch (e) {
      AppRoute.navKey.currentState?.pop();
      DialogUtils.showDialogNotification(message: e.toString());
      rethrow;
    }
  }

  Future<void> verifyToken() async {
    try {
      DialogUtils.showLoadingBar();
      await _authService.verifyEmail(email: state.email, token: state.otp);
      AppRoute.navKey.currentState?.pop();
      AppRoute.navKey.currentState?.pushNamed(UserDetailsView.route);
    } catch (e) {
      AppRoute.navKey.currentState?.pop();
      DialogUtils.showDialogNotification(message: e.toString());
      rethrow;
    }
  }

  void setPin() {
    debugPrint(state.pin);
    SecureStorage.setPin = state.pin;

    AppRoute.navKey.currentState?.pushReplacementNamed(
      AccCreated.route,
    );
  }

  Future<void> getPin() async {
    state = state.copyWith(pin: await SecureStorage.getPin);
  }
}
