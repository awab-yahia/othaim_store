import 'package:flutter/material.dart';
import 'package:othaim_store/core/constant/colors.dart';

import '../texts/big_text.dart';
import '../custom_buttons/custom_button.dart';

class SuccessPopUp extends StatelessWidget {
  const SuccessPopUp(
      {super.key,
      required this.content,
      required this.buttonLable,
      this.onTap,
      this.height});
  final String content;
  final String buttonLable;
  final Function()? onTap;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      // height: height ?? size.height * 0.225,
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: kMainColor,
            size: 64,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          BigText(text: content),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomButton(
            text: buttonLable,
            onTap: onTap,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
