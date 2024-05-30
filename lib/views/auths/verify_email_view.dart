import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/auths/userdetails_view.dart';

import 'package:smartpay/widgets_utils/app_buttons.dart';

import 'package:smartpay/widgets_utils/app_colors.dart';

import 'package:smartpay/widgets_utils/app_text.dart';

import 'package:smartpay/widgets_utils/custom_bacckicon.dart';

import 'package:smartpay/widgets_utils/pincode_input_field.dart';

import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});
  static const String route = "verify_email_view";
  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackIcon(),
          Spacing.sizedBox(height: 20.h),
          const AppText(
            text: 'Verify it’s you',
            fontSize: 24,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
          const AppText(
            text:
                'We send a code to ( *****@mail.com ). Enter it here to verify your identity',
            fontSize: 16,
          ),
          Spacing.sizedBox(height: 30.h),
          AppPincodeInputField(
            pinController: TextEditingController(),
          ),
          MainButton(
              text: 'Confirm',
              onPressed: () {
                AppRoute.navKey.currentState?.pushNamed(UserDetailsView.route);
              }),
          Spacing.sizedBox(height: 20.h),
          const Align(
              alignment: Alignment.center,
              child: AppText(text: 'Resend Code in 30 secs'))
        ],
      ),
    );
  }
}
