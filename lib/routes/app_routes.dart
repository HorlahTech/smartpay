import 'package:flutter/material.dart';
import 'package:smartpay/views/auths/signin_view.dart';
import 'package:smartpay/views/auths/signup_view.dart';
import 'package:smartpay/views/auths/userdetails_view.dart';
import 'package:smartpay/views/auths/verify_email_view.dart';
import 'package:smartpay/views/onboarding/onboarding.dart';
import 'package:smartpay/views/splash_screen/splash_screen.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';

class AppRoute {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashView.route:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Onboarding.route:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case SignInView.route:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case SignUpView.route:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case VerifyEmailView.route:
        return MaterialPageRoute(builder: (_) => const VerifyEmailView());
      case UserDetailsView.route:
        return MaterialPageRoute(builder: (_) => const UserDetailsView());

      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
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
