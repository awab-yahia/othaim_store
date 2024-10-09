import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/lotties/loading.dart';
import 'package:othaim_store/features/cart/domain/entities/cart_item.dart';
import 'package:othaim_store/features/cart/presentation/controller/cart_controller.dart';

import '../../../../../core/widgets/texts/big_text.dart';

class ProductQuantityButtons extends StatelessWidget {
  const ProductQuantityButtons({super.key, required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartController) {
        return cartController.isLoading.value
            ? LoadingWidget(
                height: Get.height * .066,
                width: Get.width * 0.4,
                path: 'assets/animations/please_wait.json',
              )
            : Container(
                width: Get.width * 0.3,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.01,
                    vertical: Get.height * 0.008,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () async {
                          // await cartController
                          //     .increaseItemQuantity(cartItem);
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
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      const BigText(text: '1'),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          // cartController.decreaseItemQuantity(cartItem);
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
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
