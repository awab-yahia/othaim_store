import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';

class HighlightContainer extends StatelessWidget {
  const HighlightContainer(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.color,
      this.radius});
  final double? height;
  final double? width, radius;
  final Color? color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: width ?? Get.width,
      decoration: BoxDecoration(
          color: color ?? kHighLightColor,
          borderRadius: BorderRadius.circular(radius ?? 5)),
      child: child,
    );
  }
}
