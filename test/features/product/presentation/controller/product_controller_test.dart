import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:othaim_store/features/product/data/repositories/product_repository_impl.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';
import 'package:othaim_store/features/product/domain/usecases/get_products_usecase.dart';
import 'package:othaim_store/features/product/presentation/controller/product_controller.dart';

class MockGetProductsUseCase extends Mock implements GetProductsUseCase {}

class MockProductRepositoryImpl extends Mock implements ProductRepositoryImpl {}

void main() {
  late ProductController productController;
  late MockGetProductsUseCase mockGetProductsUseCase;

  setUp(() {
    mockGetProductsUseCase = MockGetProductsUseCase();
    productController = ProductController(
      getProductsUseCase: mockGetProductsUseCase,
      repository: MockProductRepositoryImpl(),
    );
  });

  test('Initial values are correct', () {
    expect(productController.products, []);
    expect(productController.isLoading.value, false);
    expect(productController.selectedProduct, null);
  });

  // test('Fetch products updates products list', () async {
  //   List<ProductModel> productList = [
  //     const ProductModel(
  //       id: 1,
  //       title: 'Product 1',
  //       price: 100.0,
  //       category: 'Category 1',
  //       description: 'Description 1',
  //       image: 'Image URL 1',
  //     ),
  //     const ProductModel(
  //       id: 2,
  //       title: 'Product 2',
  //       price: 200.0,
  //       category: 'Category 2',
  //       description: 'Description 2',
  //       image: 'Image URL 2',
  //     ),
  //   ];

  //   when(mockGetProductsUseCase.execute()).thenAnswer((_) => productList);

  //   await productController.fetchProducts();

  //   expect(productController.products, productList);
  //   expect(productController.isLoading.value, false);
  // });

  test('Select product updates selectedProduct', () {
    const product = Product(
      id: 1,
      title: 'Product 1',
      price: 100.0,
      category: 'Category 1',
      description: 'Description 1',
      image: 'Image URL 1',
    );
    productController.selectProduct(product: product);

    expect(productController.selectedProduct, product);
  });

  test('Hide overlay updates selectedProduct and removes entry', () {
    const product = Product(
      id: 1,
      title: 'Product 1',
      price: 100.0,
      category: 'Category 1',
      description: 'Description 1',
      image: 'Image URL 1',
    );
    productController.selectedProduct = product;

    productController.hideOverlay();

    expect(productController.selectedProduct, null);
    expect(productController.entry, null);
  });
}
