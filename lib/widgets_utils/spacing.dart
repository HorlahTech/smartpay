import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing {
  Spacing._();
  static EdgeInsets pagePadding =
      const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
  static SizedBox sizedBox({double? width, double? height}) => SizedBox(
        width: width?.w,
        height: height?.h,
      );

  static Widget spacer = const Expanded(child: SizedBox.shrink());
}
