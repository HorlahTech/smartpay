// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class MainButton extends StatelessWidget {
  final TextStyle childTextStyle;
  final String text;
  final VoidCallback onPressed;
  final Widget child;
  final bool isLoading;
  final double? elevation;
  final bool changeColor;
  final Color loadingColor;
  final Color textColor;
  final Color bgcolor;
  final Widget? icon;
  final BorderSide borderSide;
  double? height;
  double borderRadius;

  MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgcolor = AppColors.black,
    this.elevation = 2,
    this.isLoading = false,
    this.changeColor = false,
    this.height,
    this.borderSide = BorderSide.none,
    this.loadingColor = Colors.white,
    this.textColor = AppColors.white,
    this.child = const SizedBox.shrink(),
    this.borderRadius = 16,
    this.childTextStyle = const TextStyle(
      color: Colors.transparent,
    ),
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: textColor,
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w700,
    );
    return MaterialButton(
      height: 56.h,

      color:
          isLoading || changeColor ? AppColors.black.withOpacity(.5) : bgcolor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), side: borderSide),
      onPressed: onPressed,
      minWidth: double.infinity,
      elevation: elevation,
      child: icon == null
          ? Text(text, style: textStyle)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon!,
                Spacing.sizedBox(width: 8.w),
                Text(text, style: textStyle)
              ],
            ),
      // height: height,
    );
  }
}
