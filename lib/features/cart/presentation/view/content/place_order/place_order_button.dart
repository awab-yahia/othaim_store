import 'package:othaim_store/core/widgets/custom_buttons/custom_button.dart';
import 'package:othaim_store/core/widgets/texts/big_text.dart';
import 'package:othaim_store/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton(
      {super.key, required this.totalPrice, required this.cartController});
  final num totalPrice;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: Get.height * 0.06,
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: BigText(
                text: 'Place order'.tr,
                fontColor: Colors.white,
              ),
            ),
            Row(
              children: [
                const VerticalDivider(
                  thickness: 2,
                  indent: 4,
                  endIndent: 4,
                ),
                BigText(
                  text: '${totalPrice.roundToDouble()} ${'SAR'.tr}',
                  fontColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
