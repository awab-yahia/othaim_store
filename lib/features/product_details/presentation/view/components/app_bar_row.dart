import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:othaim_store/features/product/presentation/widgets/product_card/content/product_like_btn.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.03, vertical: Get.width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  //dynamic link
                },
                child: SvgPicture.asset('assets/icons/share.svg'),
              ),
              SizedBox(width: Get.width * .045),
              ProductLikeButton(currentProduct: product),
            ],
          )
        ],
      ),
    );
  }
}
