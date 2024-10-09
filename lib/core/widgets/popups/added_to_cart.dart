import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/custom_buttons/custom_button.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import '../texts/big_text.dart';

class AddedToCartPopUp extends StatelessWidget {
  const AddedToCartPopUp({
    super.key,
    required this.content,
    required this.buttonLable,
    required this.returnButtonLable,
    required this.onConfirm,
    required this.onCancel,
    this.height,
    this.title,
    required this.product,
    required this.quantity,
  });
  final String content;
  final String buttonLable;
  final String returnButtonLable;
  final String? title;
  final Function()? onConfirm;
  final Function()? onCancel;
  final double? height;
  final Product product;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: Colors.green,
            size: 120,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          BigText(
            text: content,
            fontColor: Colors.green,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: Container(
              height: Get.height * 0.06,
              decoration: BoxDecoration(
                color: kCartPopupItemColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Container(
                            height: Get.height * 0.03,
                            width: Get.width * 0.1,
                            decoration: BoxDecoration(
                                color: kHighLightColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: BigText(
                              text: 'x$quantity',
                              fontColor: kMainColor,
                            ))),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        BigText(text: '${product.title}'),
                      ],
                    ),
                    Row(
                      children: [
                        BigText(
                          text: '${product.price! * quantity} ${'SAR'.tr}',
                          fontColor: kMainColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomButton(
            text: buttonLable,
            onTap: onConfirm,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomButton(
            borderColor: kPrimaryButtonColor,
            color: const Color(0x00f3f3f3),
            text: returnButtonLable,
            onTap: onCancel,
            fontColor: kPrimaryButtonColor,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
