import 'package:flutter_test/flutter_test.dart';
import 'package:othaim_store/features/product/data/models/product_model.dart';

void main() {
  group('Product Model', () {
    test('should create a product with correct values', () {
      const product = ProductModel(
          id: 1,
          title: 'Test Product',
          price: 100.0,
          category: "cat one",
          description: " here is decs",
          image: "fff.png");

      expect(product.id, 1);
      expect(product.title, 'Test Product');
      expect(product.category, "cat one");
      expect(product.description, " here is decs");
      expect(product.image, "fff.png");
    });
  });
}
