// Importing necessary packages for the application
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/controllers/auths/auth_controller/auth_controller.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/auths/signin_view.dart';
import 'package:smartpay/views/auths/verify_email_view.dart';
import 'package:smartpay/widgets_utils/app_buttons.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_container.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/constants.dart';
import 'package:smartpay/widgets_utils/custom_bacckicon.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/input_text_fields.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

// Defining the SignUpView w
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  // Defining a static constant for the route name to easily reference this screen in navigation
  static const String route = "signup_view";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

// State class for SignUpView to manage the state of the SignUpView widget
class _SignUpViewState extends State<SignUpView> {
  // Controller to manage the input in the email text field
  final TextEditingController _emailController = TextEditingController();
  // GlobalKey to identify the form and enable form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose of the email controller when the widget is removed from the widget tree to free up resources
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Using ScreenBody widget to wrap the main content of the screen
    return ScreenBody(
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          // Accessing the AuthController to handle authentication-related logic
          final stateRead = ref.read(authController.notifier);

          // Defining the form for user input with validation
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom widget for the back icon
                const CustomBackIcon(),
                // Adding vertical spacing
                Spacing.sizedBox(height: 20.h),
                // Rich text to display the heading with different styles
                const Text.rich(TextSpan(
                    text: 'Create a ',
                    style: TextStyle(
                        fontSize: 24,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text: 'Smartpay ',
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: '\naccount',
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColors.black,
                            fontWeight: FontWeight.w700),
                      )
                    ])),
                // Adding vertical spacing
                Spacing.sizedBox(height: 30.h),
                // Email input field with validation and controller
                TextInputField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: stateRead.onChangeEmail,
                    validate: stateRead.validateEmail,
                    hintText: 'Email',
                    controller: _emailController),
                // Adding vertical spacing
                Spacing.sizedBox(height: 20.h),

                // Main button for form submission with validation check
                MainButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Trigger email verification process
                        stateRead.initVerifyEmail();
                      }
                    }),
                // Adding vertical spacing
                Spacing.sizedBox(height: 20.h),
                // Divider with text in the middle for alternative sign-up options
                const IntrinsicHeight(
                    child: Row(children: [
                  Expanded(
                    child: Divider(
                      thickness: .5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: AppText(text: 'OR'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: .5,
                    ),
                  )
                ])),
                // Adding vertical spacing
                Spacing.sizedBox(height: 24.h),
                // Row for social sign-up options with icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppContainer(
                      height: defaultSize,
                      width: 155,
                      boxShadow: shadowstyle,
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      child: SvgPicture.asset(AppImage.googleLogo),
                    ),
                    AppContainer(
                      height: defaultSize,
                      width: 155,
                      boxShadow: shadowstyle,
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      child: SvgPicture.asset(AppImage.appleLogo),
                    ),
                  ],
                ),
                // Vertical spacer for extra spacing
                Spacing.spacer,
                // Text at the bottom prompting user to sign in if they already have an account
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(TextSpan(
                      text: 'Don’t have an account? ',
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: 'Sign In ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to SignInView when tapped
                              AppRoute.navKey.currentState
                                  ?.pushNamed(SignInView.route);
                            },
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ])),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
