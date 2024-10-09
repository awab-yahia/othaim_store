import 'package:flutter/material.dart';

BoxDecoration cardDecoration() {
  return BoxDecoration(
    color: const Color.fromARGB(255, 255, 255, 255),
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(.1),
          blurRadius: 10,
          spreadRadius: 0,
          offset: const Offset(0, 0)),
    ],
  );
}
