import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import '../../../../../../../../../../../core/widgets/texts/big_text.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.rating,
    required this.paymentCount,
  });
  final String rating;
  final String paymentCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
      child: Row(
        children: [
          const Icon(
            Icons.star_rounded,
            color: kSecondaryColor,
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          BigText(
            text: '${'rate'.tr} $rating',
            fontWeight: FontWeight.w900,
            fontColor: kSecondaryTextColor,
            fontSize: 16,
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          Container(
            height: Get.width * 0.015,
            width: Get.width * 0.015,
            decoration: BoxDecoration(
                color: kSecondaryTextColor,
                borderRadius: BorderRadius.circular(99)),
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          const Icon(
            Icons.shopify,
            color: kMainColor,
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          BigText(
            text: '$paymentCount ${'Purchase this week'.tr}',
            fontColor: kSecondaryTextColor,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
