import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
import 'package:smartpay/widgets_utils/dialog_utils.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/input_text_fields.dart';
import 'package:country_picker/country_picker.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});
  static const String route = "userdetails_view";
  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackIcon(),
          Spacing.sizedBox(height: 20.h),
          const Text.rich(TextSpan(
              text: 'Tell us a bit about',
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700),
              children: [
                TextSpan(
                  text: '\nyourself ',
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700),
                ),
              ])),
          Spacing.sizedBox(height: 30.h),
          TextInputField(
              hintText: 'Full name', controller: TextEditingController()),
          Spacing.sizedBox(height: 16.h),
          TextInputField(
              hintText: 'Username (Optional)',
              controller: TextEditingController()),
          Spacing.sizedBox(height: 16.h),
          TextInputField(
              hintText: 'Select Country',
              obscureText: true,
              keyboardType: TextInputType.none,
              suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              onTap: () {
                DialogUtils.countryPicker();
              },
              controller: TextEditingController()),
          Spacing.sizedBox(height: 16.h),
          TextInputField(
              hintText: 'password',
              obscureText: true,
              suffixIcon: const Icon(Icons.visibility_off_outlined),
              controller: TextEditingController()),
          Spacing.sizedBox(height: 24.h),
          MainButton(text: 'Continue', onPressed: () {}),
        ],
      ),
    );
  }
}
