import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/texts/big_text.dart';

class QuantityButtons extends StatelessWidget {
  const QuantityButtons(
      {super.key,
      this.borderColor,
      required this.qty,
      this.index,
      required this.productId});
  final Color? borderColor;
  final int qty;
  final int productId;

  final int? index;
  // final ShoppingCartController shoppingCartController =
  //     Get.isRegistered<ShoppingCartController>()
  //         ? Get.find()
  //         : Get.put(ShoppingCartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? kPrimaryButtonColor,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.01,
          vertical: Get.height * 0.008,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                // if (index != null) {
                //   // shoppingCartController.increaseQTY(index!);
                // } else {
                //   shoppingCartController.increaseInitQty(productId);
                // }
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryButtonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.width * 0.01,
                        horizontal: Get.width * 0.01),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )),
            ),
            // GetBuilder<ShoppingCartController>(
            //     builder: (shoppingCartController) =>

            const BigText(text: '1')
            // BigText(text: '${productQty ?? shoppingCartController.initQty}')

            // )
            ,

            InkWell(
              onTap: () {
                if (index != null) {
                  // shoppingCartController.decreaseQTY(index!);
                } else {
                  // shoppingCartController.decreaseInitQty(productId);
                }
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: kSecondaryButtonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.width * 0.01,
                        horizontal: Get.width * 0.01),
                    child: const Icon(
                      Icons.remove,
                      color: kMainColor,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
