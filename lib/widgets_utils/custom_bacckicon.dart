import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_container.dart';
import 'package:smartpay/widgets_utils/constants.dart';

class CustomBackIcon extends StatelessWidget {
  const CustomBackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoute.navKey.currentState?.pop();
      },
      child: AppContainer(
        height: 40, width: 40,
        // padding: const EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(12.r),
        alignment: Alignment.center,
        color: AppColors.white,
        boxShadow: shadowstyle,
        // border: Border.all(width: .5, color: AppColors.primary50),
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: AppColors.black,
        ),
      ),
    );
  }
}
