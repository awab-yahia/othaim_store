import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/widgets/custom_buttons/custom_button.dart';
import 'package:othaim_store/core/widgets/popups/please_wait_popup.dart';
import 'package:othaim_store/core/widgets/popups/trigger_popups.dart';
import 'package:othaim_store/core/widgets/texts/small_text.dart';
import 'package:othaim_store/features/cart/presentation/controller/cart_controller.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:othaim_store/features/product/presentation/controller/product_controller.dart';
import 'package:othaim_store/features/product/presentation/widgets/product_card/content/card_decoration.dart';
import 'package:othaim_store/features/product_details/presentation/view/components/bottom_navbar/quantity_buttons.dart';

class PobUpProductCard extends StatelessWidget {
  PobUpProductCard({
    super.key,
    required this.product,
  });
  final Product product;
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .7,
      height: Get.height * .30,
      decoration: cardDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(),
            const Center(
              child: SmallText(
                  text: "There are no colors or sizes for this product"),
            ),
            Row(children: [
              Expanded(
                  flex: 3,
                  child: InkWell(
                      onTap: () async {
                        productController.hideOverlay();
                        triggerPopup(
                          isDismissible: true,
                          content: const PleaseWaitPopup(),
                        );
                        // final CartController cartController = Get.find();
                        // Get.back();

                        // await cartController.addItemToCart(product);
                      },
                      child: CustomButton(
                        text: 'Add'.tr,
                        height: Get.height * .055,
                      ))),

              const SizedBox(width: 5),
              //

              Expanded(
                flex: 4,
                child: QuantityButtons(
                  qty: 1,
                  //  Get.find<ShoppingCartController>().initQty,
                  productId: product.id!,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
