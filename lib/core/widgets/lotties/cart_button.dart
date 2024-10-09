import 'package:othaim_store/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CartLoadingWidget extends StatelessWidget {
  const CartLoadingWidget({super.key, this.path});
  final String? path;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.13,
      color: kMainColor,
      child:
          Lottie.asset(path ?? "assets/animations/cart.json", width: Get.width),
    );
  }
}
