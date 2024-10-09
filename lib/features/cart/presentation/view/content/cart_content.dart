import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/popups/please_wait_popup.dart';
import 'package:othaim_store/core/widgets/popups/trigger_popups.dart';
import 'package:othaim_store/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:othaim_store/features/cart/presentation/view/content/cart_product_card.dart';

import 'place_order/place_order_button.dart';

class ShoppingCartContent extends StatelessWidget {
  const ShoppingCartContent({
    super.key,
    required this.cartController,
  });
  final CartController cartController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RefreshIndicator(
          onRefresh: () async {
            // cartController.getCartProducts();
          },
          child: ListView.builder(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height * 0.06),
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                return Slidable(
                  key: ValueKey(cartController.cartItems[index].id),
                  startActionPane: ActionPane(
                      extentRatio: 0.15,
                      motion: const BehindMotion(),
                      children: [
                        Center(
                          child: FloatingActionButton(
                            mini: true,
                            isExtended: true,
                            tooltip: 'Remove Item'.tr,
                            heroTag: '$index',
                            backgroundColor: kHighLightDangerColor,
                            onPressed: () async {
                              triggerPopup(
                                  content: const PleaseWaitPopup(),
                                  isDismissible: false);
                              // cartController.removeProductfromCart(
                              //     index: index,
                              //     itemId: cartController
                              //         .cartItems[index].id);
                            },
                            child: const Icon(
                              Icons.delete_forever,
                              color: kBackgroundColor,
                            ),
                          ),
                        )
                      ]),
                  endActionPane: ActionPane(
                      extentRatio: 0.15,
                      motion: const BehindMotion(),
                      children: [
                        Center(
                          child: FloatingActionButton(
                            mini: true,
                            isExtended: true,
                            tooltip: 'Remove Item'.tr,
                            heroTag: '$index',
                            backgroundColor: kHighLightDangerColor,
                            onPressed: () async {
                              triggerPopup(
                                  content: const PleaseWaitPopup(),
                                  isDismissible: false);
                              // cartController.removeProductfromCart(
                              //     index: index,
                              //     itemId: cartController
                              //         .cartItems[index].id!);
                            },
                            child: const Icon(
                              Icons.delete_forever,
                              color: kBackgroundColor,
                            ),
                          ),
                        )
                      ]),
                  child: CartProductCard(
                    cartItem: cartController.cartItems[0],
                  ),
                );
              }),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: PlaceOrderButton(
            totalPrice: 100 //  cartController.total
            ,
            cartController: cartController,
          ),
        ),
      ],
    );
  }
}
