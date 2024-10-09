import 'package:othaim_store/core/widgets/texts/ellipsis_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleAndDiscription extends StatelessWidget {
  const TitleAndDiscription(
      {super.key, required this.name, required this.description});

  final String name;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        EllipsisText(
          align: TextAlign.start,
          fontWeight: FontWeight.bold,
          maxLine: 1,
          text: name,
          fontSize: 15,
          fontColor: Colors.black,
        ),
        SizedBox(
          height: Get.height * .009,
        ),
        EllipsisText(
          align: TextAlign.start,
          text: description,
          fontSize: 12,
          maxLine: 2,
        ),

        //
      ],
    );
  }
}
