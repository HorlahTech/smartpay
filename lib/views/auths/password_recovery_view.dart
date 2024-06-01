import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/auths/newpassword_view.dart';
import 'package:smartpay/views/auths/verify_email_view.dart';
import 'package:smartpay/widgets_utils/app_buttons.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/input_text_fields.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class PasswordRecoveryView extends StatefulWidget {
  const PasswordRecoveryView({super.key});
  static const String route = "pass_recovery";

  @override
  State<PasswordRecoveryView> createState() => _PasswordRecoveryViewState();
}

class _PasswordRecoveryViewState extends State<PasswordRecoveryView> {
  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImage.lockIcon),
          const AppText(
            text: 'Passsword Recovery',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          const AppText(
            text:
                'Enter your registered email below to receive password instructions',
            fontSize: 16,
          ),
          Spacing.sizedBox(height: 30),
          TextInputField(
              hintText: 'Email', controller: TextEditingController()),
          Spacing.spacer,
          MainButton(
              text: 'Send me email',
              onPressed: () {
                AppRoute.navKey.currentState?.pushNamed(VerifyEmailView.route);
              }),
        ],
      ),
    );
  }
}
