import 'package:othaim_store/core/services/connectivity_service.dart';
import 'package:othaim_store/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:othaim_store/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:othaim_store/features/cart/data/models/cart_item_model.dart';
import 'package:othaim_store/features/cart/domain/entities/cart_item.dart';
import 'package:othaim_store/features/cart/domain/repositories/cart_repository.dart';
import 'package:othaim_store/features/product/data/models/product_model.dart';

class CartItemRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final CartLocalDataSource localDataSource;
  final ConnectionService connectivityService;

  CartItemRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivityService,
  });

  @override
  Future<List<CartItem>> getCartItems() async {
    if (connectivityService.isConnected.value == false) {
      return _getCartItemsFromLocal();
    } else {
      return await _getCartItemsFromRemote();
    }
  }

  @override
  Future<void> addToCart(CartItem cartItem) async {
    final cartItemModel = CartItemModel(
      id: cartItem.id,
      userId: cartItem.userId,
      date: cartItem.date,
      products: cartItem.products
          .map((product) => ProductModel.fromEntity(product))
          .toList(),
    );
    if (connectivityService.isConnected.value == true) {
      await remoteDataSource.addToCart(cartItemModel);
    }
    await localDataSource.insertCartItem(cartItemModel);
  }

  @override
  Future<void> deleteFromCart(int cartItemId) async {
    if (connectivityService.isConnected.value) {
      await remoteDataSource.deleteFromCart(cartItemId);
    }
    await localDataSource.deleteCartItem(cartItemId);
  }

  Future<List<CartItem>> _getCartItemsFromLocal() async {
    final localCartItems = await localDataSource.getCartItems();
    return localCartItems.map((cartItem) => cartItem.toEntity()).toList();
  }

  Future<List<CartItem>> _getCartItemsFromRemote() async {
    final remoteCartItems = await remoteDataSource.getCartItems();
    for (var cartItem in remoteCartItems) {
      await localDataSource.insertCartItem(cartItem);
    }
    return remoteCartItems.map((cartItem) => cartItem.toEntity()).toList();
  }
}
