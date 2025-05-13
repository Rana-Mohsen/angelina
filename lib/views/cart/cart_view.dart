import 'package:angelina/constants.dart';
import 'package:angelina/views/cart/widgets/custom_product_cart.dart';
import 'package:angelina/views/cart/view_model/cart_list/cart_list_cubit.dart';
import 'package:angelina/views/cart/widgets/cart_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("السلة")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<CartListCubit, CartListState>(
              builder: (context, state) {
                if (state is CartListEmpty || cartList.isEmpty) {
                  return Expanded(
                    child: const Center(child: Text("السلة فارغة")),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                   // clipBehavior: Clip.none,
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartList.length,
                    separatorBuilder: (context, index) => const SizedBox(),

                    itemBuilder:
                        (context, index) =>
                            CustomCartProduct(product: cartList[index]),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(child: CartInfo()),
            ),
          ],
        ),
      ),
    );
  }
}
