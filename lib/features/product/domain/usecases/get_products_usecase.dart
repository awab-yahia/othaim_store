import 'package:othaim_store/features/product/data/repositories/product_repository_impl.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';

class GetProductsUseCase {
  final ProductRepositoryImpl repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> execute() async {
    return await repository.getProducts();
  }
}
