import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
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
  static countryPicker() => showCountryPicker(
        context: AppRoute.navKey.currentContext!,
        moveAlongWithKeyboard: true,
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
          bottomSheetHeight: 500, // Optional. Country list modal height
          //Optional. Sets the border radius for the bottomsheet.
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          //Optional. Styles the search field.
          inputDecoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Start typing to search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFF8C98A8).withOpacity(0.2),
              ),
            ),
          ),
        ),
        onSelect: (Country country) =>
            print('Select country: ${country.displayName}'),
      );
}
