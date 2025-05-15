import 'package:angelina/constants.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/home/view_model/cubit/products_cubit/products_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_list_state.dart';

class CartListCubit extends Cubit<CartListState> {
  final ProductsCubit productsCubit;
  CartListCubit(this.productsCubit) : super(CartListInitial());
  double totalPrice = 0;
  Set<int> loadingItems = {};

  void emptyCart() async {
    cartList = [];
    cartTotalPrice();
    emit(CartListEmpty());
  }

  Future<void> removeProductFromCart(ProductModel product) async {
    if (cartList.isEmpty) {
      cartTotalPrice();

      emit(CartListEmpty());
    } else {
      emit(CartListLoading());
      cartList.remove(product);
      cartTotalPrice();

      emit(CartSuccess(cartList));
    }
  }

  Future<void> addProductToCart(ProductModel product) async {
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

    //await Future.delayed(Duration(milliseconds: 1000));
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
      //await Future.delayed(Duration(milliseconds: 1000));
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
    totalPrice = totalPrice.roundToDouble();
  }
  bool isInCart(int productId) {
    
   
    return cartList.any((item) => item.id == productId);
  }
}
