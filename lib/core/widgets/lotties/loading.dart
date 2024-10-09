import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.path, this.height, this.width});
  final String? path;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? Get.height,
        width: width ?? Get.width * 0.65,
        child: Lottie.asset(path ?? "assets/animations/loading.json"),
      ),
    );
  }
}
