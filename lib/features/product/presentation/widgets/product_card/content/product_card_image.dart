import 'package:flutter/material.dart';
import 'package:othaim_store/core/widgets/network_image_viewer.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:get/get.dart';
import 'package:othaim_store/features/product/presentation/controller/product_controller.dart';
import 'package:othaim_store/features/product_details/presentation/view/proudct_details.dart';

class ProductCardImage extends StatelessWidget {
  const ProductCardImage({
    super.key,
    required this.currentProduct,
  });
  final Product currentProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Get.find<ProductController>().selectedProduct == null) {
          Get.to(() => ProductDetails(product: currentProduct));
        } else {
          Get.find<ProductController>().hideOverlay();
        }
      },
      child: SizedBox(
          child: NetworkImageViewer(
        width: double.maxFinite,
        imagePath: currentProduct.image,
        height: Get.height * .07,
      )),
    );
  }
}
