import 'package:othaim_store/features/cart/domain/entities/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<void> addToCart(CartItem cartItem);
  Future<void> deleteFromCart(int cartItemId);
}
