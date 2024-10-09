import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/widgets/network_image_viewer.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:othaim_store/features/product_details/presentation/controller/product_details_controller.dart';
import 'package:othaim_store/features/product_details/presentation/view/components/app_bar_row.dart';
import 'package:othaim_store/features/product_details/presentation/view/components/bottom_navbar/bottom_navbar.dart';
import 'package:othaim_store/features/product_details/presentation/view/components/description_box.dart';
import 'package:othaim_store/features/product_details/presentation/view/components/price_row.dart';
import 'package:othaim_store/features/product_details/presentation/view/components/rating_row.dart';

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.product});

  Product product;

  final ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarRow(
                  product: product,
                ),

                // Image here
                NetworkImageViewer(
                  height: Get.height * .4,
                  imagePath: product.image,
                  width: Get.width,
                ),
                SizedBox(height: Get.height * 0.02),

                PriceRow(
                  productName: product.title ?? "",
                  productPrice: '${product.price} ${'SAR'.tr}',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                DescriptionBox(content: product.description ?? ""),
                SizedBox(height: Get.height * 0.02),
                const RatingRow(rating: "5", paymentCount: '30'),
                SizedBox(height: Get.height * 0.02),

                // const ProductReviewsWidget()
              ],
            ),
          ),
        )),
        bottomNavigationBar:

            // GetBuilder<ShoppingCartController>(
            //     builder: (ShoppingCartController shoppingCartController) {
            // return
            SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .03),
              child: ProductDetailsBottomNavBar(
                rowHeight: Get.height * 0.09,
                product: product,
              )),
        )
        // ;
        // }),
        );
  }
}
