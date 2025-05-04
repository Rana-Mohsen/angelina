import 'package:angelina/constants.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_list_state.dart';

class CartListCubit extends Cubit<CartListState> {
  CartListCubit() : super(CartListInitial());
  double totalPrice = 0;
  Set<int> loadingItems = {};
  Future<void> removeProductFromCart(ProductModel product) async {
    if (cartList.isEmpty) {
      emit(CartListEmpty());
    } else {
      emit(CartListLoading());

      await Future.delayed(
        Duration(microseconds: 5000),
      ).then((value) => cartList.remove(product));
      emit(CartSuccess(cartList));
    }
  }

  Future<void> addProductFromCart(ProductModel product) async {
    bool exist = cartList.contains(product);
    if (!exist) {
      cartList.add(product);
      cartTotalPrice();
      emit(CartListItemChanged());
    }
  }

  Future<void> increaseProductCart(ProductModel product) async {
    loadingItems.add(product.id);
    emit(CartCountLoading(loadingItems));

    await Future.delayed(Duration(milliseconds: 1000));
    for (var cartItem in cartList) {
      if (cartItem.id == product.id) {
        cartItem.count += 1;
        break;
      }
    }
    cartTotalPrice();
    loadingItems.remove(product.id);
    emit(CartListItemChanged());
  }

  Future<void> decreaseProductCart(ProductModel product) async {
    loadingItems.add(product.id);
    emit(CartCountLoading(loadingItems));

    if (product.count > 1) {
      //print("whhhhhhhhhhhhhy");
      await Future.delayed(Duration(milliseconds: 1000));
      for (var cartItem in cartList) {
        if (cartItem.id == product.id) {
          cartItem.count -= 1;
          break;
        }
      }
      cartTotalPrice();
    }
    loadingItems.remove(product.id);
    emit(CartListItemChanged());
  }

  cartTotalPrice() {
    totalPrice = 0;
    for (var item in cartList) {
      totalPrice += double.parse(item.price) * item.count;
    }
  }
}
