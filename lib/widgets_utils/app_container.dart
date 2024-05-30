import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.border,
    this.color,
    this.borderRadius,
    this.boxShadow,
    this.child,
    this.height,
    this.width,
    this.padding,
    this.shape = BoxShape.rectangle,
    this.alignment = Alignment.center,
    this.marging,
  });
  final Color? color;
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? marging;
  final Border? border;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Alignment? alignment;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: marging,
      alignment: alignment,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: border,
        shape: shape,
        boxShadow: boxShadow,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
