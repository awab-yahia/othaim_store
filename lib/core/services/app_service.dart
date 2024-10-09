import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:othaim_store/core/services/connectivity_service.dart';
import 'package:othaim_store/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:othaim_store/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:othaim_store/features/cart/domain/usecaces/add_to_cart.dart';
import 'package:othaim_store/features/cart/domain/usecaces/delete_from_cart.dart';
import 'package:othaim_store/features/cart/domain/usecaces/get_cart_items.dart';
import 'package:othaim_store/features/cart/presentation/controller/cart_controller.dart';
import 'package:othaim_store/features/product/data/datasources/product_local_data_source.dart';
import 'package:othaim_store/features/product/data/datasources/product_remote_data_source.dart';
import 'package:othaim_store/features/product/data/repositories/product_repository_impl.dart';
import 'package:othaim_store/features/product/domain/usecases/get_products_usecase.dart';
import 'package:othaim_store/features/product/presentation/controller/product_controller.dart';

import '../../features/cart/data/datasources/cart_local_data_source.dart';

void initServices() async {
  // Initialize Connectivity Service
  ConnectionService connectionService = Get.put(ConnectionService());
  // Initialize data sources
  final remoteDataSource = ProductRemoteDataSource(dio: Dio());
  final localDataSource = ProductLocalDataSource();

  // Initialize the repository
  final productRepository = ProductRepositoryImpl(
      connectivityService: connectionService,
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource);

  // Inject the repository into the controller
  Get.put(ProductController(
      repository: productRepository,
      getProductsUseCase: GetProductsUseCase(productRepository)));

  CartRemoteDataSource cartRemoteDataSource = CartRemoteDataSource(dio: Dio());
  CartLocalDataSource cartLocalDataSource = CartLocalDataSource();
  CartItemRepositoryImpl cartItemRepositoryImpl = CartItemRepositoryImpl(
      connectivityService: ConnectionService(),
      remoteDataSource: cartRemoteDataSource,
      localDataSource: cartLocalDataSource);

  DeleteFromCartUseCase deleteFromCartUseCase =
      DeleteFromCartUseCase(cartItemRepositoryImpl);
  AddToCartUseCase addToCartUseCase = AddToCartUseCase(cartItemRepositoryImpl);
  GetCartItemsUseCase getCartItemsUseCase =
      GetCartItemsUseCase(cartItemRepositoryImpl);

  Get.put(CartController(
      addToCartUseCase: addToCartUseCase,
      deleteFromCartUseCase: deleteFromCartUseCase,
      getCartItemsUseCase: getCartItemsUseCase));
}
