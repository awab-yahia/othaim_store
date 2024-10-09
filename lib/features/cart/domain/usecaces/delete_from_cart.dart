import 'package:othaim_store/features/cart/data/repositories/cart_repository_impl.dart';

class DeleteFromCartUseCase {
  final CartItemRepositoryImpl repository;

  DeleteFromCartUseCase(this.repository);
  Future<void> execute(int cartItemId) {
    return repository.deleteFromCart(cartItemId);
  }
}
