import 'package:flutter/material.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title ?? 'No Title'),
      subtitle: Text('\$${product.price ?? 0.0}'),
      leading: product.image != null ? Image.network(product.image!) : null,
    );
  }
}
