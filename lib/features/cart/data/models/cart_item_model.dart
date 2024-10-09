import 'package:othaim_store/features/cart/domain/entities/cart_item.dart';
import 'package:othaim_store/features/product/data/models/product_model.dart';

class CartItemModel {
  final int id;
  final int userId;
  final DateTime date;
  final List<ProductModel> products;

  CartItemModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: (json['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  CartItem toEntity() {
    return CartItem(
      id: id,
      userId: userId,
      date: date,
      products: products.map((product) => product.toEntity()).toList(),
    );
  }
}
