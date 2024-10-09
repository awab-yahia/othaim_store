import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource({required this.dio});

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((product) => ProductModel.fromJson(product))
            .toList();
      } else {
        throw FetchDataException('Failed to load products');
      }
    } catch (e) {
      throw FetchDataException('Failed to load products: ${e.toString()}');
    }
  }
}

class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);

  @override
  String toString() => 'FetchDataException: $message';
}
