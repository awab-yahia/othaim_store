import 'package:othaim_store/core/widgets/lotties/loading.dart';
import 'package:othaim_store/core/widgets/texts/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PleaseWaitPopup extends StatelessWidget {
  const PleaseWaitPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingWidget(
          width: MediaQuery.sizeOf(context).width * 0.5,
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        BigText(text: 'Please wait, We are processing your request'.tr),
      ],
    );
  }
}
