import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/texts/small_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.onTap,
    this.color,
    this.borderColor,
    this.width,
    this.height,
    this.fontSize,
    this.radius,
    this.fontWeight,
    this.fontColor,
    this.child,
  });

  final String? text;
  final Function()? onTap;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? radius;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width * 0.8,
        height: height ?? Get.height * 0.06,
        decoration: BoxDecoration(
            color: color ?? kMainColor,
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 20),
            ),
            border: Border.all(color: borderColor ?? Colors.transparent)),
        child: child ??
            Center(
              child: SmallText(
                text: '$text',
                fontSize: fontSize,
                fontColor: fontColor ?? Colors.white,
                fontWeight: fontWeight,
              ),
            ),
      ),
    );
  }
}
