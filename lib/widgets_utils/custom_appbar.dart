import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_container.dart';
import 'package:smartpay/widgets_utils/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.bgColor = AppColors.white,
    this.leadingWidget,
    this.hasLeading = true,
    this.textColor = AppColors.white,
    this.iconColor = AppColors.black,
  });
  final String title;
  final Color bgColor;
  final Color textColor;
  final Color iconColor;
  final Widget? leadingWidget;
  final bool? hasLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      // bottom:
      //     PreferredSize(preferredSize: preferredSize, child: const Divider()),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: hasLeading == null || hasLeading == false
          ? null
          : leadingWidget ??
              InkResponse(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AppContainer(
                  padding: const EdgeInsets.all(10),
                  borderRadius: BorderRadius.circular(12.r),
                  alignment: Alignment.center,
                  color: AppColors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: AppColors.primary50,
                        blurRadius: 1,
                        spreadRadius: .1)
                  ],
                  // border: Border.all(width: .5, color: AppColors.primary50),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                    color: iconColor,
                  ),
                ),
              ),
      title: AppText(
        text: title,
        color: textColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
