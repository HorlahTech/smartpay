import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smartpay/controllers/auths/auth_controller/auth_controller.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/auths/signin_view.dart';
import 'package:smartpay/views/home/home_view.dart';
import 'package:smartpay/widgets_utils/app_buttons.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class AccCreated extends StatelessWidget {
  const AccCreated({super.key});
  static const String route = 'acc_created';

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 130, child: Image.asset(AppImage.congratsIcon)),
          Spacing.sizedBox(height: 30),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final stateWatch = ref.read(authController);
              return AppText(
                text: 'Congratulations, ${stateWatch.fullName}',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              );
            },
          ),
          Spacing.sizedBox(height: 12),
          const AppText(
            text: 'You’ve completed the onboarding,\nyou can start using',
            fontSize: 16,
            textAlign: TextAlign.center,
          ),
          Spacing.sizedBox(height: 30),
          MainButton(
              text: 'Get Started',
              onPressed: () {
                AppRoute.navKey.currentState?.pushNamed(SignInView.route);
              }),
        ],
      ),
    );
  }
}
