import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:othaim_store/core/widgets/texts/big_text.dart';

class NoProductsInCartWidget extends StatelessWidget {
  const NoProductsInCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/empty_cart.json',
            height: MediaQuery.sizeOf(context).height * 0.3,
            width: MediaQuery.sizeOf(context).width,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.075,
            child: BigText(
              text:
                  'Enjoy shopping\nyour products will appear here once you add them'
                      .tr,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
