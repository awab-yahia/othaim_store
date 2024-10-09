 import 'package:othaim_store/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
