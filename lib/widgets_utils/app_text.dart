import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      this.color = AppColors.textColor,
      this.fontSize = 14,
      this.height = 1.5,
      this.fontWeight = FontWeight.w400,
      this.textAlign = TextAlign.start,
      required this.text});
  final String text;
  final double? fontSize, height;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize!.sp,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
    );
  }
}
