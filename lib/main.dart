// Importing necessary Flutter packages and application-specific packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/splash_screen/splash_screen.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';

// Main function, the entry point of the application
void main() {
  // Wrapping the app with ProviderScope for state management using Riverpod
  runApp(const ProviderScope(child: MyApp()));
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Building the widget tree
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Configuring ScreenUtil for responsive design
      designSize: const Size(375, 744),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          // Disabling the debug banner
          debugShowCheckedModeBanner: false,
          // Setting up the navigator key and route generation
          navigatorKey: AppRoute.navKey,
          onGenerateRoute: AppRoute.onGenerateRoute,
          // Defining the initial route of the application
          initialRoute: SplashView.route,
          // Defining the application theme
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBg,
            useMaterial3: true,
            fontFamily: 'SF-Pro-Display',
          ),
        );
      },
    );
  }
}
