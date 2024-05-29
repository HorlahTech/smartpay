import 'package:flutter/material.dart';

import 'package:smartpay/widgets_utils/spacing.dart';

class ScreenBody extends StatelessWidget {
  const ScreenBody({super.key, required this.child, this.appbar});
  final Widget child;
  final PreferredSizeWidget? appbar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SafeArea(
          child: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: Spacing.pagePadding,
          child: child,
        ),
      )),
    );
  }
}
