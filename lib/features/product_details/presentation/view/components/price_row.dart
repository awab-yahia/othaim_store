import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import '../../../../../../../../../../../core/widgets/texts/big_text.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    super.key,
    required this.productName,
    required this.productPrice,
  });
  final String productName;
  final String productPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: BigText(
              text: productName,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          BigText(
            text: productPrice,
            fontColor: kMainColor,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
