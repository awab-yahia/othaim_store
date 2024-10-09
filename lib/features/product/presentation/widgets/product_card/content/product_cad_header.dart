import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:othaim_store/features/product/presentation/widgets/product_card/content/product_card_image.dart';
import 'package:othaim_store/features/product/presentation/widgets/product_card/content/product_like_btn.dart';

class ProductCardHeader extends StatefulWidget {
  const ProductCardHeader({super.key, required this.currentProduct});

  final Product currentProduct;

  @override
  State<ProductCardHeader> createState() => _ProductCardHeaderState();
}

class _ProductCardHeaderState extends State<ProductCardHeader> {
  @override
  Widget build(BuildContext context) {
// this is for text fav btn position
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;
    log(isRTL.toString());
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ProductCardImage(currentProduct: widget.currentProduct),
        Positioned(
          top: 0,
          right: !isRTL ? 0 : null,
          left: isRTL ? 0 : null,
          // alignment: AlignmentDirectional.topEnd,
          child: ProductLikeButton(
            currentProduct: widget.currentProduct,
          ),
        ),
      ],
    );
  }
}
