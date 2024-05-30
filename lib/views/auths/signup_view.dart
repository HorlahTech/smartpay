import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/auths/signin_view.dart';
import 'package:smartpay/views/auths/verify_email_view.dart';
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

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const String route = "signup_view";
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackIcon(),
          Spacing.sizedBox(height: 20.h),
          const Text.rich(TextSpan(
              text: 'Create a ',
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700),
              children: [
                TextSpan(
                  text: 'Smartpay ',
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: '\naccount',
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700),
                )
              ])),
          Spacing.sizedBox(height: 30.h),
          TextInputField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
              controller: TextEditingController()),
          Spacing.sizedBox(height: 20.h),
          Spacing.sizedBox(height: 20.h),
          MainButton(
              text: 'Sign Up',
              onPressed: () {
                AppRoute.navKey.currentState?.pushNamed(VerifyEmailView.route);
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
          Spacing.spacer,
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
                    text: 'Sign In ',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppRoute.navKey.currentState
                            ?.pushNamed(SignInView.route);
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
    );
  }
}
