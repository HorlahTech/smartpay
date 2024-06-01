// Importing necessary Flutter packages and application-specific views and utilities
import 'package:flutter/material.dart';
import 'package:smartpay/views/auths/acc_created.dart';
import 'package:smartpay/views/auths/newpassword_view.dart';
import 'package:smartpay/views/auths/password_recovery_view.dart';
import 'package:smartpay/views/auths/signin_view.dart';
import 'package:smartpay/views/auths/signup_view.dart';
import 'package:smartpay/views/auths/userdetails_view.dart';
import 'package:smartpay/views/auths/verify_email_view.dart';
import 'package:smartpay/views/home/home_view.dart';
import 'package:smartpay/views/onboarding/onboarding.dart';
import 'package:smartpay/views/splash_screen/splash_screen.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';

// Class for handling application routes and Navigation
class AppRoute {
  // Global key for the navigator to manage navigation
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  // Method to generate routes based on the route settings
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // Case for SplashView route
      case SplashView.route:
        return MaterialPageRoute(builder: (_) => const SplashView());
      // Case for Onboarding route
      case Onboarding.route:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      // Case for SignInView route
      case SignInView.route:
        return MaterialPageRoute(builder: (_) => const SignInView());
      // Case for SignUpView route
      case SignUpView.route:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      // Case for VerifyEmailView route
      case VerifyEmailView.route:
        // Casting the arguments to VerificationScreenEnum
        VerificationScreenEnum data =
            routeSettings.arguments as VerificationScreenEnum;
        return MaterialPageRoute(
            builder: (_) => VerifyEmailView(
                  data: data,
                ));
      // Case for UserDetailsView route
      case UserDetailsView.route:
        return MaterialPageRoute(builder: (_) => const UserDetailsView());
      // Case for AccCreated route
      case AccCreated.route:
        return MaterialPageRoute(builder: (_) => const AccCreated());
      // Case for PasswordRecoveryView route
      case PasswordRecoveryView.route:
        return MaterialPageRoute(builder: (_) => const PasswordRecoveryView());
      // Case for NewPasswordView route
      case NewPasswordView.route:
        return MaterialPageRoute(builder: (_) => const NewPasswordView());
      // Case for HomeView route
      case HomeView.route:
        return MaterialPageRoute(builder: (_) => const HomeView());
      // Default case for unknown routes, showing an error screen
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}

// Error screen to display when an unknown route is accessed
class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  // Static route for error screen
  static const String route = 'error_Screen';

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    // centered text indicating screen not found
    return const ScreenBody(
        child: Center(
      child: AppText(text: 'Screen Not Found'),
    ));
  }
}
