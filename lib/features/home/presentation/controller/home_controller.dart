import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int index = 0;

  final PageController controller = PageController();

  void updateIndex(int value) {
    index = value;
    update();
  }
}
