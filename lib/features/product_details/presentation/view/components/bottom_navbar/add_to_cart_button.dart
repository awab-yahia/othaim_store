import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/custom_buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    required this.onTap,
    super.key,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: Get.width * 0.55, to make it flexeble to another uses ,, so width will be depend on row and flex .. ill use it on card
      child: CustomButton(
        onTap: onTap,
        text: 'Add to cart'.tr,
        fontWeight: FontWeight.w600,
        fontColor: Colors.white,
        fontSize: 18,
        color: kMainColor,
      ),
    );
  }
}
