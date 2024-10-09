import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/features/product/data/repositories/product_repository_impl.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:othaim_store/features/product/domain/usecases/get_products_usecase.dart';

class ProductController extends GetxController {
  final GetProductsUseCase getProductsUseCase;

  ProductController(
      {required this.getProductsUseCase,
      required ProductRepositoryImpl repository});

  var products = <Product>[].obs;
  var isLoading = false.obs;

  Product? selectedProduct;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  getProducts() async {
    try {
      isLoading.value = true;
      final productList = await getProductsUseCase.execute();
      products.assignAll(productList);
    } finally {
      isLoading.value = false;
    }
  }

  OverlayEntry? entry;

  selectProduct({Product? product}) {
    // this method is suppose to :
    // 1- select product if no product selected
    // 2- hide entry if another product was selected
    try {
      if (selectedProduct == null) {
        selectedProduct = product;
      } else {
        selectedProduct = null;
        entry?.remove();
        entry = null;
      }
      update();
    } catch (e) {
      update();
      rethrow;
    }
  }

  // overlay part

  void hideOverlay() {
    selectedProduct = null;
    entry?.remove();
    entry = null;
    update();
  }
}
