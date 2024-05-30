import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_container.dart';
import 'package:smartpay/widgets_utils/custom_appbar.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const String route = "signup_view";
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(
        children: [
          AppContainer(
            height: 40, width: 40,
            // padding: const EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(12.r),
            alignment: Alignment.center,
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.primary50.withOpacity(.5),
                  blurRadius: .5,
                  spreadRadius: .1)
            ],
            // border: Border.all(width: .5, color: AppColors.primary50),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
