import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductLikeButton extends StatefulWidget {
  const ProductLikeButton({super.key, required this.currentProduct});

  final Product currentProduct;
  @override
  State<ProductLikeButton> createState() => _ProductLikeButtonState();
}

class _ProductLikeButtonState extends State<ProductLikeButton> {
  bool isProductLiked = false;
  @override
  void initState() {
    isProductLiked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      isLiked: false,
      likeBuilder: (isLiked) {
        Color color = isLiked ? Colors.red : Colors.grey;
        return SvgPicture.asset("assets/icons/like.svg", color: color);
      },
      onTap: (isLiked) async {
        //temp
        setState(() {
          isProductLiked = !isProductLiked;
        });

        return !isLiked;
      },
    );
  }
}
