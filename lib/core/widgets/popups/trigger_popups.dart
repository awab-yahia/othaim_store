import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

void triggerPopup({
  required Widget content,
  String? buttonLable,
  Function()? onButtonPressed,
  double? height,
  bool isDismissible = true,
  Color? backgroundColor,
  String? title,
  TextStyle? titleStyle,
  EdgeInsets? titlePadding,
}) {
  Get.defaultDialog(
    title: title ?? '',
    titleStyle: titleStyle,
    backgroundColor: backgroundColor,
    titlePadding: titlePadding ?? EdgeInsets.zero,
    content: content,
    barrierDismissible: isDismissible,
  );
}
