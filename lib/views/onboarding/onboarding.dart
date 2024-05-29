import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smartpay/widgets_utils/app_buttons.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
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

  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: Spacing.pagePadding,
        child: Column(
          children: [
            // SvgPicture.asset(AppImagesAsset.onBoardLogo),
            const Align(
              alignment: Alignment.topRight,
              child: AppText(
                text: 'Skip',
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacing.sizedBox(height: 40.h),
            Expanded(
              child: CarouselSlider(
                  items: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          // height: 380.h,
                          width: 360.w,
                          // decoration: BoxDecoration(
                          //     // color: AppColors.white,
                          //     borderRadius: BorderRadius.circular(8.r),
                          //     image: DecorationImage(
                          //       // fit: BoxFit.cover,
                          //       image: Image.asset(
                          //         AppImagesAsset.onboarding1,
                          //         fit: BoxFit.cover,
                          //       ).image,
                          //     )),
                        ),
                        Spacing.sizedBox(height: 24.h),
                        const Expanded(
                            child: AppText(
                                textAlign: TextAlign.center,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                                text:
                                    'Finance app the safest \nand most trusted')),
                        Spacing.sizedBox(height: 16.h),
                        const AppText(
                          text:
                              'Your finance work starts here. Our here to help \nyou track and deal with speeding up your \ntransactions.',
                          textAlign: TextAlign.center,
                          color: AppColors.textColor,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 200.h,
                          width: 360.w,
                          // decoration: BoxDecoration(
                          //     // color: AppColors.white,
                          //     borderRadius: BorderRadius.circular(8.r),
                          //     image: DecorationImage(
                          //       // fit: BoxFit.cover,
                          //       image: Image.asset(
                          //         AppImagesAsset.onboarding2,
                          //         fit: BoxFit.cover,
                          //       ).image,
                          //     )),
                        ),
                        Spacing.sizedBox(height: 24.h),
                        const Expanded(
                            child: AppText(
                                textAlign: TextAlign.center,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                                text:
                                    'The fastest transaction \nprocess only here')),
                        Spacing.sizedBox(height: 16.h),
                        const AppText(
                          text:
                              'Get easy to pay all your bills with just a few \nsteps. Paying your bills become fast and \nefficient.',
                          textAlign: TextAlign.center,
                          color: AppColors.textColor,
                        )
                      ],
                    ),
                  ],
                  options: CarouselOptions(
                    height: 520,
                    aspectRatio: 10 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.ease,
                    enlargeCenterPage: false,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reson) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            AnimatedSmoothIndicator(
              count: 2,
              activeIndex: _pageIndex,
              effect: ExpandingDotsEffect(
                  dotHeight: 6.h,
                  spacing: 4,
                  expansionFactor: 5,
                  dotWidth: 6.w,
                  dotColor: const Color(0xffE5E7EB),
                  activeDotColor: AppColors.black),
            ),
            Spacing.sizedBox(height: 50.h),
            MainButton(
                text: 'Create Account',
                onPressed: () {
                  // AppRoute.navKey.currentState?.pushNamed(SignUpScreen.route);
                }),
          ],
        ),
      )),
    );
  }
}
