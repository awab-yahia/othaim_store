import 'package:flutter_test/flutter_test.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';

void main() {
  const tProduct = Product(
    id: 1,
    title: 'Test Product',
    price: 9.99,
    category: 'Test Category',
    description: 'Test Description',
    image: 'test_image.png',
  );

  test('should be a valid entity', () {
    // assert
    expect(tProduct, isA<Product>());
  });
}
