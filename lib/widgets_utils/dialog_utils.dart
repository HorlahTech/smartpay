import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/widgets_utils/app_buttons.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_container.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class DialogUtils {
  DialogUtils._();

  static get popScreen => AppRoute.navKey.currentState?.pop();
  static Future<void> showLoadingBar() {
    return showDialog(
      context: AppRoute.navKey.currentContext!,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.7),
      builder: (context) => Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 1),
        child: Center(
          child: LoadingAnimationWidget.fallingDot(
            color: AppColors.primaryColor,
            size: 50,
          ),
        ),
      ),
    );
  }

  static void showDialogNotification(
          {required String message,
          String? title,
          String buttonText = 'Try Again',
          bool isError = true,
          VoidCallback? onpressed,
          Widget? customIcon}) =>
      showDialog(
        barrierDismissible: false,
        context: AppRoute.navKey.currentContext!,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: AppContainer(
              padding: EdgeInsets.all(20.r),
              height: 282.h,
              width: 379.w,
              borderRadius: BorderRadius.circular(24.r),
              alignment: Alignment.topCenter,
              color: AppColors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customIcon ??
                      SvgPicture.asset(
                          isError ? AppImage.errorIcon : AppImage.successIcon),
                  Spacing.sizedBox(height: 10),
                  title != null
                      ? AppText(
                          text: title,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        )
                      : const SizedBox.shrink(),
                  Expanded(
                    child: AppText(textAlign: TextAlign.center, text: message),
                  ),
                  MainButton(
                      text: buttonText,
                      onPressed: onpressed ??
                          () {
                            AppRoute.navKey.currentState?.pop();
                          })
                ],
              )),
        ),
      );
  static countryPicker({required void Function(Country) onSelect}) =>
      showCountryPicker(
          context: AppRoute.navKey.currentContext!,
          // moveAlongWithKeyboard: true,
          countryListTheme: CountryListThemeData(
            flagSize: 25,
            backgroundColor: AppColors.white,
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            bottomSheetHeight: 600, // Optional. Country list modal height
            //Optional. Sets the border radius for the bottomsheet.
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            //Optional. Styles the search field.
            inputDecoration: const InputDecoration(
              fillColor: AppColors.filledColor,
              // constraints: BoxConstraints(maxWidth: 300),
              filled: true,
              labelText: 'Search',
              // hintText: 'Start typing to search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
          onSelect: onSelect,
          customFlagBuilder: (country) {
            return SizedBox(
                // width: 200,
                height: 64,
                child: Row(
                  children: [
                    AppText(
                      text: country.flagEmoji,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    Spacing.sizedBox(width: 16),
                    AppText(
                      text: country.countryCode,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                    ),
                    Spacing.sizedBox(width: 16),
                  ],
                ));
          });

  static Future showBottomSheet(
      {bool isScrollControlled = true,
      Color? backgroundColor = Colors.transparent,
      double height = 324,
      required List<Widget> children,
      Color? barrierColor,
      String? title,
      MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
      CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center}) {
    return showModalBottomSheet(
      context: AppRoute.navKey.currentContext!,
      useSafeArea: true,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      showDragHandle: false,

      // transitionAnimationController: ,
      // constraints:
      //     BoxConstraints(maxHeight: height, maxWidth: double.maxFinite),
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: AnimatedContainer(
          height: height,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          duration: const Duration(seconds: 10),
          child: AppContainer(
            padding: Spacing.pagePadding,
            width: double.maxFinite,
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Column(
              children: [
                Align(
                  child: SvgPicture.asset(AppImage.dashHandle),
                ),
                Spacing.sizedBox(height: 20),
                title == null
                    ? const SizedBox.shrink()
                    : AppText(
                        text: title,
                        fontSize: 20.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ...children
              ],
            ),
          ),
        ),
      ),
    );
  }
}
