import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smartpay/controllers/auths/auth_controller/auth_controller.dart';
import 'package:smartpay/controllers/home/home_controller/home_controller.dart';
import 'package:smartpay/utils/secure_storage.dart';
import 'package:smartpay/widgets_utils/app_buttons.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/dialog_utils.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/pincode_input_field.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  static const String route = 'home_view';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeController.notifier).getSecreteMsg();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          final stateRead = ref.read(homeController.notifier);
          final authWatch = ref.watch(authController);
          final stateWatch = ref.watch(homeController);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 130, child: Image.asset(AppImage.congratsIcon)),
              Spacing.sizedBox(height: 30),
              AppText(
                text: 'Hello, ${authWatch.fullName}',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              Spacing.sizedBox(height: 12),
              AppText(
                text: stateWatch.secretMessage,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
              Spacing.sizedBox(height: 30),
              MainButton(
                  text: 'New Message',
                  onPressed: () {
                    final TextEditingController pinController =
                        TextEditingController();
                    DialogUtils.showBottomSheet(children: [
                      const AppText(
                        text: 'Enter Your pin to generate a new secret Message',
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacing.sizedBox(height: 20),
                      AppPincodeInputField(
                          pinController: pinController,
                          oncomplete: (val) async {
                            DialogUtils.popScreen;
                            if (await SecureStorage.getPin ==
                                pinController.text) {
                              stateRead.getSecreteMsg();
                              return;
                            }
                            DialogUtils.showDialogNotification(
                                title: "Pin Error",
                                message: "Enter a correct Pin and try Again");
                          }),
                    ]);
                    // stateRead.getSecreteMsg();
                  }),
            ],
          );
        },
      ),
    );
  }
}
