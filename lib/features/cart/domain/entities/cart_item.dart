import 'package:equatable/equatable.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';

class CartItem extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final List<Product> products;

  const CartItem({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  @override
  List<Object> get props => [id, userId, date, products];
}
