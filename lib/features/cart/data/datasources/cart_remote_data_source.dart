import 'package:dio/dio.dart';
import '../models/cart_item_model.dart';

class CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSource({required this.dio});

  Future<List<CartItemModel>> getCartItems() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/carts');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((cartItem) => CartItemModel.fromJson(cartItem))
            .toList();
      } else {
        throw FetchDataException('Failed to load cart items');
      }
    } catch (e) {
      throw FetchDataException('Failed to load cart items: ${e.toString()}');
    }
  }

  Future<void> addToCart(CartItemModel cartItem) async {
    try {
      await dio.post('https://fakestoreapi.com/carts', data: cartItem.toJson());
    } catch (e) {
      throw FetchDataException('Failed to add cart item: ${e.toString()}');
    }
  }

  Future<void> deleteFromCart(int cartItemId) async {
    try {
      await dio.delete('https://fakestoreapi.com/carts/$cartItemId');
    } catch (e) {
      throw FetchDataException('Failed to delete cart item: ${e.toString()}');
    }
  }
}

class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);

  @override
  String toString() => 'FetchDataException: $message';
}
