import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/custom_buttons/custom_button.dart';
import 'package:othaim_store/core/widgets/texts/big_text.dart';

class DeletePopupWidget extends StatelessWidget {
  const DeletePopupWidget({
    super.key,
    required this.content,
    this.onTap,
  });
  final String content;
  final Function()? onTap;

  get kDefaultHorizontalPadding => null;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: Get.height * 0.02),
          BigText(text: content, fontSize: 22, fontColor: Colors.black),

          SizedBox(height: Get.height * 0.05),

          //

          Row(
            children: [
              Expanded(
                  child: CustomButton(
                      text: 'Yes Delete',
                      color: kDeleteColor,
                      fontColor: Colors.white,
                      borderColor: kDeleteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      onTap: onTap)),
              SizedBox(width: kDefaultHorizontalPadding),
              //
              Expanded(
                  child: CustomButton(
                      color: Colors.white,
                      fontColor: kPrimaryButtonColor,
                      borderColor: kPrimaryButtonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      text: 'Back'.tr,
                      onTap: () {
                        Get.back();
                      }))
            ],
          ),
        ],
      ),
    );
  }
}
