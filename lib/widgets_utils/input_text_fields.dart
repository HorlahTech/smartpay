import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class TextInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon, prefixIcon;
  final double? width;
  final double borderRadius;
  final String? label;
  final String? errorText;
  final bool enabled;
  final bool visibilityControl;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validate;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final InputBorder? border;
  final int maxLine;
  final Color fillColor;
  final Color hintextColor;
  final AutovalidateMode? autovalidateMode;
  final VoidCallback? suffixIconOnTap;
  final bool isNotCollapsible;
  final bool hasTopPadding;

  const TextInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.border,
    this.validate,
    this.hasTopPadding = false,
    this.onChanged,
    this.borderRadius = 8,
    this.isNotCollapsible = true,
    this.maxLine = 1,
    this.autovalidateMode,
    this.errorText,
    this.suffixIcon,
    this.prefixIcon,
    this.onEditingComplete,
    this.inputFormatters,
    this.fillColor = AppColors.filledColor,
    this.onTap,
    this.width,
    this.enabled = true,
    this.obscureText = false,
    this.visibilityControl = false,
    this.hintextColor = AppColors.hintTextColor,
    this.label,
    this.suffixIconOnTap,
  }) : super(key: key);

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  // bool get showSuffixIcon => widget.suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.hasTopPadding
            ? SizedBox(
                height: 20.h,
              )
            : const SizedBox.shrink(),
        widget.label != null
            ? AppText(
                text: widget.label!,
                fontSize: 14.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              )
            : const SizedBox.shrink(),
        widget.label != null
            ? Spacing.sizedBox(height: 8)
            : const SizedBox.shrink(),
        TextFormField(
          autovalidateMode: widget.autovalidateMode,
          onTap: widget.onTap,
          obscureText: widget.obscureText,
          onChanged: widget.onChanged,
          maxLines: widget.maxLine,
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          onEditingComplete: widget.onEditingComplete,
          inputFormatters: widget.inputFormatters,
          validator: widget.validate,
          style: TextStyle(fontSize: 13.sp, color: AppColors.black),
          decoration: widget.isNotCollapsible
              ? InputDecoration(
                  errorText: widget.errorText,
                  focusedBorder: widget.border ??
                      OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                        ),
                      ),
                  filled: true,
                  fillColor: widget.fillColor,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20),
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  border: widget.border ??
                      OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        // borderSide: BorderSide(
                        //   color: AppColors.greyBorder.withOpacity(.5),
                        // ),
                      ),
                  enabledBorder: widget.border ??
                      OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        // borderSide: BorderSide(
                        //   color: AppColors.greyBorder.withOpacity(.5),
                        // ),
                      ),
                  hintStyle: TextStyle(
                      fontSize: 13.sp,
                      color: widget.hintextColor,
                      fontWeight: FontWeight.w400),
                  hintText: widget.hintText,
                )
              : InputDecoration.collapsed(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      fontSize: 13.sp,
                      color: widget.hintextColor,
                      fontWeight: FontWeight.w400),
                ),
        ),
      ],
    );
  }
}
