import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/onboarding/onboarding.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      AppRoute.navKey.currentState?.pushNamed(Onboarding.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInDown(
            duration: const Duration(seconds: 2),
            animate: true,
            child: SvgPicture.asset(
              AppImage.logo,
              height: 72,
              width: 72,
            )),
        Spacing.sizedBox(height: 16),
        FadeInUp(
          animate: true,
          duration: const Duration(seconds: 2),
          child: const Text.rich(TextSpan(
              text: 'Smart',
              style: TextStyle(
                  fontSize: 32,
                  // fontFamily: 'SF-Pro-Display',
                  color: AppColors.black,
                  fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: 'Pay.',
                  style: TextStyle(
                      fontSize: 32,
                      // fontFamily: 'SF-Pro-Display',
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                )
              ])),
        )
      ],
    ));
  }
}
