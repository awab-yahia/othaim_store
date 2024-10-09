import 'dart:developer';

import 'package:othaim_store/core/services/connectivity_service.dart';
import 'package:othaim_store/features/product/data/datasources/product_local_data_source.dart';
import 'package:othaim_store/features/product/data/datasources/product_remote_data_source.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:othaim_store/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final ConnectionService connectivityService;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivityService,
  });

  @override
  Future<List<Product>> getProducts() async {
    if (connectivityService.isConnected.value == false) {
      // Use local data source when there's no internet
      return _getProductsFromLocal();
    } else {
      // Use remote data source and cache the results locally
      return await _getProductsFromRemote();
    }
  }

  Future<List<Product>> _getProductsFromLocal() async {
    try {
      final localProducts = await localDataSource.getProducts();
      return localProducts.map((product) => product.toEntity()).toList();
    } catch (e) {
      log('Error fetching products from local data source: $e');
      return [];
    }
  }

  Future<List<Product>> _getProductsFromRemote() async {
    try {
      final remoteProducts = await remoteDataSource.getProducts();
      log('Fetched ${remoteProducts.length} products from remote data source');

      for (var product in remoteProducts) {
        await localDataSource.insertProduct(product);
      }

      return remoteProducts.map((product) => product.toEntity()).toList();
    } catch (e) {
      log('Error fetching products from remote data source: $e');
      return [];
    }
  }
}
