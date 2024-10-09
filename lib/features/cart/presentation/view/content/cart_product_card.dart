import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/features/cart/domain/entities/cart_item.dart';
import 'package:othaim_store/features/cart/presentation/view/content/quantity_cart_product.dart';
import '../../../../../core/widgets/texts/big_text.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.cartItem,
  });
  final CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * .02, vertical: Get.height * 0.01),
      child: Container(
        height: Get.height * 0.15,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 40,
              )
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * .05,
            vertical: Get.height * 0.02,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.15,
                  child: CachedNetworkImage(
                    imageUrl: "cartItem.product.image " ?? "",
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      cartItem.products[0].title ?? "",
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text:
                              '${cartItem.products[0].price?.roundToDouble()} ${'SAR'.tr}',
                          fontColor: kMainColor,
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                        ),
                        ProductQuantityButtons(
                          cartItem: cartItem,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
