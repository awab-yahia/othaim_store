import 'package:othaim_store/core/widgets/popups/please_wait_popup.dart';
import 'package:othaim_store/core/widgets/popups/trigger_popups.dart';
import 'package:flutter/material.dart';
 import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:othaim_store/features/product_details/presentation/view/components/bottom_navbar/add_to_cart_button.dart';
import 'package:othaim_store/features/product_details/presentation/view/components/bottom_navbar/quantity_buttons.dart';

class ProductDetailsBottomNavBar extends StatelessWidget {
  const ProductDetailsBottomNavBar({
    super.key,
    required this.product,
    required this.rowHeight,
  });
  final Product product;
  final double rowHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: rowHeight,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 4,
            child: AddToCartButton(
              onTap: () async {
                triggerPopup(
                  isDismissible: false,
                  content: const PleaseWaitPopup(),
                );
                // if (Get.find<ShoppingCartController>().properties.isEmpty) {
                //   await Get.find<ShoppingCartController>()
                //       .addProductToCart(product);
                // } else {
                //   Get.find<ShoppingCartController>().addSelectedProperty(
                //       propertyId: product.properties?[0].id,
                //       optionId: product.properties?[0].option?[0].id);
                //   await Get.find<ShoppingCartController>()
                //       .addProductToCart(product);
                // }
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: QuantityButtons(
              qty: 1,
              // Get.find<ShoppingCartController>().initQty,
              productId: product.id!,
            ),
          ),
        ],
      ),
    );
  }
}
