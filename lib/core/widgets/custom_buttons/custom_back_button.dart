import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/custom_buttons/custom_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onCancel,
    this.buttonText,
  });
  final Function()? onCancel;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: kTransparentColor,
      borderColor: kDarkButtonColor,
      text: buttonText ?? 'Back'.tr,
      fontColor: kDarkButtonColor,
      fontWeight: FontWeight.bold,
      onTap: () {
        if (onCancel != null) {
          onCancel!();
        } else {
          Get.back();
        }
      },
    );
  }
}
