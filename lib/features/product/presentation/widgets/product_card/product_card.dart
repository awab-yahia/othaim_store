import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/constant/colors.dart';
import 'package:othaim_store/core/widgets/texts/ellipsis_text_widget.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:othaim_store/features/product/presentation/controller/product_controller.dart';
import 'package:othaim_store/features/product/presentation/widgets/pop_up_product_card/pop_up_product_card.dart';
import 'package:othaim_store/features/product/presentation/widgets/product_card/content/card_decoration.dart';
import 'package:othaim_store/features/product/presentation/widgets/product_card/content/highlight_container.dart';
import 'package:othaim_store/features/product/presentation/widgets/product_card/content/product_cad_header.dart';
import 'package:othaim_store/features/product/presentation/widgets/product_card/content/title_and_discription.dart';
import 'package:othaim_store/features/product_details/presentation/view/proudct_details.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.currentProduct,
  });

  final Product currentProduct;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final layerLink = LayerLink();
  @override
  void initState() {
    super.initState();
  }

  void showOverlay(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final overlay = Overlay.of(context);
      final renderBox = context.findRenderObject() as RenderBox;
      final offset = renderBox.localToGlobal(Offset.zero);

      bool isPostive = (offset.dx + Get.width * .7) < Get.width;

      productController.entry = OverlayEntry(
          builder: (context) => Positioned(
                top: 0,
                width: Get.width * .7,
                child: CompositedTransformFollower(
                  link: layerLink,
                  offset: isPostive ? Offset.zero : Offset(-Get.width * .23, 0),
                  child: buildOverlay(isPostive, context),
                ),
              ));

      overlay.insert(productController.entry!);
    });
  }

  buildOverlay(bool isPostive, context) {
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = currentDirection == TextDirection.rtl;
    if (isRTL == false) {
      isPostive = !isPostive;
    }
    return Material(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: SizedBox(
          width: Get.width * .7,
          height: Get.height * .3 + Get.height * .32,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                isPostive ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Get.height * .30,
                child: ProductCard(
                  currentProduct: widget.currentProduct,
                ),
              ),
              PobUpProductCard(
                product: widget.currentProduct,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: GetBuilder<ProductController>(
        builder: (productController) {
          return Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: Container(
                  width: Get.width * .45,
                  height: Get.height * .30,
                  // total height is 30%

                  decoration: cardDecoration(),
                  child: Padding(
                    padding: EdgeInsets.all(Get.height * .01),
                    child: Stack(
                      children: [
                        // first align for image and like it takes 15% from total height and 50% of card
                        //
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: SizedBox(
                            height: Get.height * .095,
                            child: ProductCardHeader(
                              currentProduct: widget.currentProduct,
                            ),
                          ),
                        ),

                        // product title and short description
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * .11),
                          child: InkWell(
                            onTap: () {
                              if (productController.selectedProduct == null) {
                                Get.to(() => ProductDetails(
                                    product: widget.currentProduct));
                              } else {
                                productController.selectProduct(
                                    product: widget.currentProduct);
                              }
                            },
                            child: TitleAndDiscription(
                                name: widget.currentProduct.title!,
                                description:
                                    widget.currentProduct.description ?? ""),
                          ),
                        ),

                        // product price and rate
                        Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: InkWell(
                                    onTap: () {
                                      if (productController.selectedProduct ==
                                          null) {
                                        Get.to(() => ProductDetails(
                                            product: widget.currentProduct));
                                      } else {
                                        productController.selectProduct(
                                            product: widget.currentProduct);
                                      }
                                    },
                                    child: HighlightContainer(
                                      height: Get.height * .05,
                                      child: EllipsisText(
                                        maxLine: 1,
                                        text:
                                            "${widget.currentProduct.price} ${'SAR'.tr} ",
                                        fontColor: kMainColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * .015,
                                ),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      if (productController.selectedProduct ==
                                          null) {
                                        productController.selectProduct(
                                            product: widget.currentProduct);
                                        showOverlay(context);
                                      } else {
                                        productController.selectProduct(
                                          product: null,
                                        );
                                      }
                                    },
                                    child: HighlightContainer(
                                      height: Get.height * .05,
                                      color: kMainColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: SvgPicture.asset(
                                          "assets/icons/cart.svg",
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  )));
        },
      ),
    );
  }
}
