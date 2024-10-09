// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:othaim_store/features/product/domain/repositories/product_repository.dart';
// import 'package:othaim_store/features/product/domain/entities/product.dart';

// class MockProductRepository extends Mock implements ProductRepository {}

// void main() {
//   MockProductRepository repository;

//   setUp(() {
//     repository = MockProductRepository();
//   });

//   final tProduct = Product(
//     id: 1,
//     title: 'Test Product',
//     price: '9.99',
//     category: 'Test Category',
//     description: 'Test Description',
//     image: 'test_image.png',
//   );

//   test('should return list of products', () async {
//     // arrange
//     when(repository.getProductList()).thenAnswer((_) async => [tProduct]);

//     // act
//     final result = await repository.getProductList();

//     // assert
//     expect(result, [tProduct]);
//     verify(repository.getProductList());
//   });
// }
