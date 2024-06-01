import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/constants.dart';

class AppPincodeInputField extends StatefulWidget {
  const AppPincodeInputField({
    super.key,
    required TextEditingController pinController,
    this.oncomplete,
    this.onChanged,
    this.keyboardType,
    this.validator,
  }) : _pinController = pinController;

  final TextEditingController _pinController;
  final void Function(String)? oncomplete;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  final TextInputType? keyboardType;

  @override
  State<AppPincodeInputField> createState() => _AppPincodeInputFieldState();
}

class _AppPincodeInputFieldState extends State<AppPincodeInputField> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      appContext: context,
      enableActiveFill: true,
      length: 5,
      onChanged: widget.onChanged,
      onCompleted: widget.oncomplete,
      blinkWhenObscuring: true,
      pastedTextStyle: const TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      autoFocus: true,
      autoUnfocus: true,
      controller: widget._pinController,
      cursorColor: Colors.black,
      validator: widget.validator,
      animationType: AnimationType.none,
      keyboardType: TextInputType.number,
      animationCurve: Curves.linear,
      animationDuration: const Duration(milliseconds: 5),
      pinTheme: PinTheme(
        borderWidth: 1,
        activeBorderWidth: 1,
        inactiveBorderWidth: 1,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12.r),
        fieldOuterPadding: const EdgeInsets.only(left: 10),
        fieldHeight: defaultSize.h,
        fieldWidth: defaultSize.w,
        inactiveColor: AppColors.greyBorder,
        activeColor: AppColors.filledColor,
        selectedFillColor: AppColors.filledColor,
        activeFillColor: AppColors.filledColor,
        inactiveFillColor: AppColors.filledColor,
        selectedColor: AppColors.primaryColor,
      ),
    );
  }
}
