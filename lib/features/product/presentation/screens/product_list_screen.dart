import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/lotties/loading.dart';
import 'package:othaim_store/core/widgets/texts/big_text.dart';
import 'package:othaim_store/features/product/presentation/controller/product_controller.dart';
import 'package:othaim_store/features/product/presentation/widgets/product_card/product_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => PproductsScreenState();
}

class PproductsScreenState extends State<ProductsScreen> {
  final layerLink = LayerLink();
  ProductController productController = Get.find();
  @override
  void initState() {
    productController.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => productController.selectProduct(),
      child: Obx(() {
        return productController.isLoading.value
            ? const LoadingWidget()
            : productController.products.isEmpty
                ? const Center(
                    child: Text('No Data! \nThis section shows the products'))
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * .025),
                            child: const BigText(
                              text: "Products",
                              fontColor: kMainColor,
                              fontSize: 20,
                            ),
                          ),
                          GetBuilder<ProductController>(
                            builder: (productController) => GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    productController.products.length + 2,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: Get.height * .30,
                                ),
                                itemBuilder: (context, index) {
                                  return index <
                                          productController.products.length
                                      ? ProductCard(
                                          currentProduct:
                                              productController.products[index],
                                        )
                                      : SizedBox(
                                          width: Get.width * .45,
                                          height: Get.height * .30,
                                        );
                                }),
                          ),
                        ],
                      ),
                    ),
                  );
      }),
    );
  }
}
