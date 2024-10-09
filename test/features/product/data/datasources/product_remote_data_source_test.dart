// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dio/dio.dart';
// import 'package:othaim_store/features/product/data/datasources/product_remote_data_source.dart';

// class MockDio extends Mock implements Dio {}

// void main() {
//   late ProductRemoteDataSource dataSource;
//   late MockDio mockDio;

//   setUp(() {
//     mockDio = MockDio();
//     dataSource = ProductRemoteDataSource(dio: mockDio);
//   });

//   test(
//       'getProducts returns list of products if the http call completes successfully',
//       () async {
//     final responsePayload = [
//       {
//         'id': 1,
//         'title': 'Test Product',
//         'price': 100.0,
//         'category': 'TestCategory',
//         'description': 'Test Description',
//         'image': 'TestImage.jpg',
//       },
//     ];

//     when(mockDio.get('https://fakestoreapi.com/products')).thenAnswer(
//         (_) async => Response(
//             data: responsePayload,
//             statusCode: 200,
//             requestOptions: RequestOptions(path: '')));

//     final products = await dataSource.getProducts();

//     expect(products.length, 1);
//     expect(products[0].id, 1);
//     expect(products[0].title, 'Test Product');
//   });

//   test('getProducts throws an exception if the http call fails', () {
//     when(mockDio.get('https://fakestoreapi.com/products')).thenThrow(
//         DioException(
//             requestOptions: RequestOptions(path: ''), error: 'Network error'));

//     expect(() async => await dataSource.getProducts(),
//         throwsA(isA<FetchDataException>()));
//   });
// }
