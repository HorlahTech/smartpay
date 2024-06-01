import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/views/auths/signin_view.dart';
import 'package:smartpay/views/auths/signup_view.dart';
import 'package:smartpay/views/splash_screen/splash_screen.dart';

import 'package:smartpay/widgets_utils/app_buttons.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/image_files.dart';
import 'package:smartpay/widgets_utils/screen_body.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const String route = 'onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final ValueNotifier<int> _pageIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(
        children: [
          // SvgPicture.asset(AppImagesAsset.onBoardLogo),
          InkWell(
            onTap: () {
              AppRoute.navKey.currentState?.pushNamed(SignUpView.route);
            },
            child: const Align(
              alignment: Alignment.topRight,
              child: AppText(
                text: 'Skip',
                color: AppColors.primary50,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Spacing.sizedBox(height: 50.h),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.65,
            child: PageView(
              controller: _pageController,
              onPageChanged: (val) {
                _pageIndex.value = val;
              },
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Image.asset(AppImage.onboarding1device),
                        Positioned(
                            left: -40,
                            top: 30,
                            child: SvgPicture.asset(AppImage.onboarding1)),
                        Positioned(
                          bottom: -30,
                          child: Container(
                            // height: 300,
                            color: AppColors.white,
                            child: Column(
                              children: [
                                Spacing.sizedBox(height: 40),
                                const AppText(
                                    textAlign: TextAlign.center,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                    text:
                                        'Finance app the safest \nand most trusted'),
                                Spacing.sizedBox(height: 16.h),
                                const AppText(
                                  text:
                                      'Your finance work starts here. Our here to help \nyou track and deal with speeding up your \ntransactions.',
                                  textAlign: TextAlign.center,
                                  color: AppColors.textColor,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Image.asset(AppImage.onboarding2device),
                        Positioned(
                            left: -40,
                            top: 90,
                            child: Image.asset(AppImage.onboarding2)),
                        Positioned(
                          bottom: -30,
                          child: Container(
                            // height: 300,
                            color: AppColors.white,
                            child: Column(
                              children: [
                                Spacing.sizedBox(height: 40),
                                AppText(
                                    textAlign: TextAlign.center,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                    text:
                                        'The fastest transaction \nprocess only here'),
                                Spacing.sizedBox(height: 16.h),
                                const AppText(
                                  text:
                                      '''Get easy to pay all your bills with just a few\n steps. Paying your bills become fast and \nefficient.''',
                                  textAlign: TextAlign.center,
                                  color: AppColors.textColor,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          ValueListenableBuilder(
              valueListenable: _pageIndex,
              builder: (context, pageIndex, _) {
                return AnimatedSmoothIndicator(
                  count: 2,
                  activeIndex: pageIndex,
                  effect: ExpandingDotsEffect(
                      dotHeight: 6.h,
                      spacing: 4,
                      expansionFactor: 5,
                      dotWidth: 6.w,
                      dotColor: const Color(0xffE5E7EB),
                      activeDotColor: AppColors.black),
                );
              }),
          Spacing.sizedBox(height: 30.h),

          ValueListenableBuilder(
              valueListenable: _pageIndex,
              builder: (context, pageIndex, _) {
                return MainButton(
                    text: pageIndex == 0 ? "Next" : 'Get Started',
                    onPressed: () {
                      pageIndex == 0
                          ? _pageController.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease)
                          : AppRoute.navKey.currentState
                              ?.pushNamed(SignUpView.route);
                    });
              }),
          Spacing.sizedBox(height: 10),
        ],
      ),
    );
  }
}
