import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    required this.text,
    this.style,
    this.fontWeight,
    this.fontColor,
    this.fontSize,
    this.align,
  });
  final String text;
  final TextStyle? style;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final double? fontSize;
  final TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.center,
      style: style ??
          TextStyle(
            color: fontColor ?? const Color(0xff333333),
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.bold,
          ),
    );
  }
}
