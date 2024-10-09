import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';

class ProductDetailsController extends GetxController {
  //bool to check if the screen loaded or not
  bool isLoading = false;

  Product? product;
}
