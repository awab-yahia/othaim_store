// lib/routes.dart
import 'package:get/get.dart';
import 'package:othaim_store/features/home/presentation/screen/home_screen.dart';
import 'package:othaim_store/features/product/presentation/screens/product_list_screen.dart';

class Routes {
  static const String home = '/';
  static const String products = '/products';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
  static const String orders = '/orders';

  static List<GetPage> getPages = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: products, page: () => const ProductsScreen()),
    // GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
  ];
}
