import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/controllers/auths/auth_controller/auth_controller.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/auths/newpassword_view.dart';

import 'package:smartpay/widgets_utils/app_buttons.dart';

import 'package:smartpay/widgets_utils/app_colors.dart';

import 'package:smartpay/widgets_utils/app_text.dart';

import 'package:smartpay/widgets_utils/custom_bacckicon.dart';
import 'package:smartpay/widgets_utils/custom_keyboard.dart';
import 'package:smartpay/widgets_utils/image_files.dart';

import 'package:smartpay/widgets_utils/pincode_input_field.dart';

import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

enum VerificationScreenEnum { verifyEmail, recoveryVerifyEmail, setPin }

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key, required this.data});
  final VerificationScreenEnum data;
  static const String route = "verify_email_view";
  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();
  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  late final bool isVerify;
  late final bool isPin;
  late final bool isRecovery;
  @override
  void initState() {
    super.initState();
    isVerify = widget.data == VerificationScreenEnum.verifyEmail;
    isPin = widget.data == VerificationScreenEnum.setPin;
    isRecovery = widget.data == VerificationScreenEnum.recoveryVerifyEmail;
    secTimer();
  }

  late Timer timer;
  final ValueNotifier<int> _time = ValueNotifier<int>(30);
  void secTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_time.value != 0) {
        _time.value--;
      } else {
        _time.value = 30;
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          final stateRead = ref.read(authController.notifier);
          final stateWatch = ref.read(authController);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isRecovery
                  ? SvgPicture.asset(AppImage.personIcon)
                  : const CustomBackIcon(),
              Spacing.sizedBox(height: 20.h),
              AppText(
                text: isVerify
                    ? 'Verify it’s you'
                    : isPin
                        ? "Set your PIN code"
                        : "Verify your identity",
                fontSize: 24,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
              AppText(
                text: isPin
                    ? "We use state-of-the-art security measures to protect your information at all times"
                    : 'We send a code to (******@${stateWatch.email.split('@')[1]}). Enter it here to verify your identity',
                fontSize: 16,
              ),
              Spacing.sizedBox(height: 30.h),
              Form(
                key: _formKey,
                child: AppPincodeInputField(
                  pinController: _pinController,
                  onChanged:
                      isPin ? stateRead.onChangePin : stateRead.onChangeOtp,
                  validator: stateRead.validatePin,
                ),
              ),
              Spacing.sizedBox(height: 20.h),
              isPin
                  ? const SizedBox.shrink()
                  : ValueListenableBuilder<int>(
                      valueListenable: _time,
                      builder: (context, time, _) {
                        return Align(
                          alignment: Alignment.center,
                          child: timer.isActive
                              ? AppText(text: 'Resend Code in $time secs')
                              : InkWell(
                                  onTap: () => secTimer(),
                                  child: const AppText(
                                    text: 'Resend Code',
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  )),
                        );
                      },
                    ),
              Spacing.sizedBox(height: 20),
              MainButton(
                  text: isPin ? "Create PIN" : 'Confirm',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      isPin
                          ? stateRead.setPin()
                          : isRecovery
                              ? AppRoute.navKey.currentState
                                  ?.pushNamed(NewPasswordView.route)
                              : stateRead.verifyToken();
                    }
                  }),
              Spacing.sizedBox(height: 20),
              CustomKeyboard(controller: _pinController),
            ],
          );
        },
      ),
    );
  }
}
