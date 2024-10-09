import 'package:get/get.dart';
import 'package:othaim_store/features/cart/domain/entities/cart_item.dart';
import 'package:othaim_store/features/cart/domain/usecaces/add_to_cart.dart';
import 'package:othaim_store/features/cart/domain/usecaces/delete_from_cart.dart';
import 'package:othaim_store/features/cart/domain/usecaces/get_cart_items.dart';

class CartController extends GetxController {
  final GetCartItemsUseCase getCartItemsUseCase;
  final AddToCartUseCase addToCartUseCase;
  final DeleteFromCartUseCase deleteFromCartUseCase;

  CartController({
    required this.getCartItemsUseCase,
    required this.addToCartUseCase,
    required this.deleteFromCartUseCase,
  });

  var cartItems = <CartItem>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  Future<void> getCartItems() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final items = await getCartItemsUseCase.execute(1);
      cartItems.assignAll(items);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addItemToCart(CartItem cartItem) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await addToCartUseCase.execute(cartItem);
      cartItems.add(cartItem);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteItemFromCart(int cartItemId) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await deleteFromCartUseCase.execute(cartItemId);
      cartItems.removeWhere((item) => item.id == cartItemId);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
