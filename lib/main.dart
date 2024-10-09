import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/services/app_service.dart';
import 'core/router/app_router.dart';

void main() {
  // Initialize Connectivity Service
  initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Othaim Store',
      // home: HomeScreen(),
      initialRoute: Routes.home,
      getPages: Routes.getPages,
    );
  }
}
