import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../core/widgets/texts/small_text.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
      child: SmallText(
        text: content,
        align: TextAlign.justify,
      ),
    );
  }
}
