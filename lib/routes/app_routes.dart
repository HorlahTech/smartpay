import 'package:flutter/material.dart';
import 'package:smartpay/views/onboarding/onboarding.dart';
import 'package:smartpay/views/splash_screen/splash_screen.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';

class AppRoute {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Onboarding.route:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      // case SignUpScreen.route:
      //   return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
    // return route;
  }
}

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  static const String route = 'error_Screen';
  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return const ScreenBody(
        child: Center(
      child: AppText(text: 'Screen Not Found'),
    ));
  }
}
