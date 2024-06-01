import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/widgets_utils/app_buttons.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/custom_bacckicon.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/input_text_fields.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});
  static const String route = "create_newpassword";

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackIcon(),
          Spacing.sizedBox(height: 30),
          const AppText(
            text: 'Create New Password',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          const AppText(
            text:
                'Please, enter a new password below different from the previous password',
            fontSize: 16,
          ),
          Spacing.sizedBox(height: 30),
          TextInputField(
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility_off_outlined),
                onPressed: () {},
              ),
              hintText: 'Password',
              controller: TextEditingController()),
          Spacing.sizedBox(height: 16),
          TextInputField(
              hintText: 'Confirm Password',
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility_off_outlined),
                onPressed: () {},
              ),
              controller: TextEditingController()),
          Spacing.spacer,
          MainButton(text: 'Create new password', onPressed: () {}),
        ],
      ),
    );
  }
}
