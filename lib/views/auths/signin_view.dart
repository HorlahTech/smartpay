import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/controllers/auths/auth_controller/auth_controller.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/auths/password_recovery_view.dart';
import 'package:smartpay/views/auths/signup_view.dart';
import 'package:smartpay/widgets_utils/app_buttons.dart';

import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_container.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/constants.dart';

import 'package:smartpay/widgets_utils/custom_bacckicon.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/input_text_fields.dart';

import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static const String route = "signin_view";
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _visibility = ValueNotifier<bool>(true);
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          final stateRead = ref.read(authController.notifier);
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackIcon(),
                  Spacing.sizedBox(height: 20.h),
                  const AppText(
                    text: 'Hi There! 👋',
                    fontSize: 24,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  const AppText(
                    text: 'Welcome back, Sign in to your account',
                    fontSize: 16,
                  ),
                  Spacing.sizedBox(height: 30.h),
                  TextInputField(
                    hintText: 'Email',
                    controller: _emailController,
                    onChanged: stateRead.onChangeEmail,
                    validate: stateRead.validateEmail,
                  ),
                  Spacing.sizedBox(height: 16.h),
                  ValueListenableBuilder(
                      valueListenable: _visibility,
                      builder: (context, visibility, _) {
                        return TextInputField(
                          hintText: 'password',
                          validate: stateRead.validatePasswordStrict,
                          onChanged: stateRead.onChangePassword,
                          controller: _passwordController,
                          suffixIcon: IconButton(
                            icon: visibility
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
                            onPressed: () {
                              _visibility.value = !_visibility.value;
                            },
                          ),
                          obscureText: visibility,
                        );
                      }),
                  Spacing.sizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      AppRoute.navKey.currentState
                          ?.pushNamed(PasswordRecoveryView.route);
                    },
                    child: const AppText(
                      text: 'Forgot Password?',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Spacing.sizedBox(height: 20.h),
                  MainButton(
                      text: 'Sign In',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          stateRead.signIn();
                        }
                      }),
                  Spacing.sizedBox(height: 20.h),
                  const IntrinsicHeight(
                      child: Row(children: [
                    Expanded(
                      child: Divider(
                        thickness: .5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: AppText(text: 'OR'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: .5,
                      ),
                    )
                  ])),
                  Spacing.sizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppContainer(
                        height: defaultSize,
                        width: 155,
                        boxShadow: shadowstyle,
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        child: SvgPicture.asset(AppImage.googleLogo),
                      ),
                      AppContainer(
                        height: defaultSize,
                        width: 155,
                        boxShadow: shadowstyle,
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        child: SvgPicture.asset(AppImage.appleLogo),
                      ),
                    ],
                  ),
                  Spacing.sizedBox(height: 100),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(TextSpan(
                        text: 'Don’t have an account? ',
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: 'Sign Up ',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                AppRoute.navKey.currentState
                                    ?.pushNamed(SignUpView.route);
                              },
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ])),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
