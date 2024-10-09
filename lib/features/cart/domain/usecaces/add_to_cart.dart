import 'package:othaim_store/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:othaim_store/features/cart/domain/entities/cart_item.dart';

class AddToCartUseCase {
  final CartItemRepositoryImpl repository;

  AddToCartUseCase(this.repository);

  Future<void> execute(CartItem cartItem) {
    return repository.addToCart(cartItem);
  }
}
