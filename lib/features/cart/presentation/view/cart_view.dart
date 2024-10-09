import 'package:othaim_store/core/widgets/lotties/loading.dart';
import 'package:othaim_store/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/features/cart/presentation/view/content/no_content/no_products_in_cart.dart';
import 'package:othaim_store/features/cart/presentation/view/content/cart_content.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final CartController cartController = Get.find();

  @override
  void initState() {
    // shoppingCartController.getCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
      return cartController.isLoading.value == false
          ? const LoadingWidget()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: cartController.cartItems.isEmpty
                  ? const NoProductsInCartWidget()
                  : ShoppingCartContent(cartController: cartController),
            );
    });
  }
}
