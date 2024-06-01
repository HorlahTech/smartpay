import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/controllers/auths/auth_controller/auth_controller.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/auths/acc_created.dart';

import 'package:smartpay/widgets_utils/app_buttons.dart';

import 'package:smartpay/widgets_utils/app_colors.dart';

import 'package:smartpay/widgets_utils/custom_bacckicon.dart';
import 'package:smartpay/widgets_utils/dialog_utils.dart';

import 'package:smartpay/widgets_utils/input_text_fields.dart';

import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});
  static const String route = "userdetails_view";
  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _fullNameController.dispose();
    _userNameController.dispose();
    _countryController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final ValueNotifier<bool> _visibility = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          final stateRead = ref.read(authController.notifier);
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackIcon(),
                Spacing.sizedBox(height: 20.h),
                const Text.rich(TextSpan(
                    text: 'Tell us a bit about',
                    style: TextStyle(
                        fontSize: 24,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text: '\nyourself ',
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ])),
                Spacing.sizedBox(height: 30.h),
                TextInputField(
                    validate: stateRead.validateFullName,
                    onChanged: stateRead.onChangeFullname,
                    hintText: 'Full name',
                    controller: _fullNameController),
                Spacing.sizedBox(height: 16.h),
                TextInputField(
                    hintText: 'Username (Optional)',
                    onChanged: stateRead.onChangeUsername,
                    controller: _userNameController),
                Spacing.sizedBox(height: 16.h),
                TextInputField(
                    hintText: 'Select Country',

                    // enabled: false,
                    validate: stateRead.validateNotEmpty,
                    keyboardType: TextInputType.none,
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                    onTap: () {
                      DialogUtils.countryPicker(onSelect: (country) {
                        _countryController.text =
                            "${country.flagEmoji} ${country.countryCode} ${country.name}";
                        stateRead.onChangeSelectedCountryCode(country);
                      });
                    },
                    controller: _countryController),
                Spacing.sizedBox(height: 16.h),
                ValueListenableBuilder(
                    valueListenable: _visibility,
                    builder: (context, visibility, _) {
                      return TextInputField(
                          hintText: 'password',
                          obscureText: visibility,
                          onChanged: stateRead.onChangePassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                _visibility.value = !_visibility.value;
                              },
                              icon: Icon(visibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined)),
                          validate: stateRead.validatePasswordStrict,
                          controller: _passwordController);
                    }),
                Spacing.sizedBox(height: 24.h),
                MainButton(
                    text: 'Continue',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        stateRead.signUp();
                      }
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
