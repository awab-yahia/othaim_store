import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/widgets/custom_buttons/custom_button.dart';
import 'package:othaim_store/core/widgets/texts/big_text.dart';

class OwnerConfirmOrderPopup extends StatelessWidget {
  const OwnerConfirmOrderPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BigText(
            text: 'Order Confirmed'.tr,
            fontSize: 14,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            child: SvgPicture.asset('assets/icons/order_placed.svg'),
          ),
          BigText(
              text: 'Order confirmed successfully and we are now processing it'
                  .tr,
              fontSize: 14,
              align: TextAlign.center),
          //
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.02),
            child: CustomButton(
              width: Get.width * 0.5,
              text: 'Go To Homepage'.tr,
              fontWeight: FontWeight.bold,
              onTap: () async {
                Get.offAll(() => ());
              },
            ),
          ),
        ],
      ),
    );
  }
}
