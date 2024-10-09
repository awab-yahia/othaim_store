import 'package:othaim_store/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:othaim_store/features/cart/domain/entities/cart_item.dart';

class GetCartItemsUseCase {
  final CartItemRepositoryImpl repository;

  GetCartItemsUseCase(this.repository);
  Future<List<CartItem>> execute(int cartItemId) {
    return repository.getCartItems();
  }
}
