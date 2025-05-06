import 'package:angelina/constants.dart';
import 'package:angelina/core/utils/functions/snack_bar.dart';
import 'package:angelina/core/widgets/custom_button.dart';
import 'package:angelina/views/cart/view_model/cart_list/cart_list_cubit.dart';
import 'package:angelina/views/favourite/widgets/custom_favorite_product.dart';
import 'package:angelina/views/favourite/view_model.dart/favorite_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المفضلة")),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteChanged) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: ListView.separated(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      //physics: const NeverScrollableScrollPhysics(),
                      itemCount: favList.length,
                      separatorBuilder: (context, index) => const SizedBox(),

                      itemBuilder:
                          (context, index) =>
                              CustomFavoriteProduct(product: favList[index]),
                    ),
                  ),
                  SizedBox(
                    child: CustomButton(
                      onTap: () {
                        for (var favItem in favList) {
                          BlocProvider.of<CartListCubit>(
                            context,
                          ).addProductToCart(favItem);
                        }
                        snackBarMessage(
                          context,
                          "تم اضافة جميع المنتجات الى السلة",
                        );
                      },
                      text: "اضافة الى السلة",
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(child: Text("You have no favorite items"));
        },
      ),
    );
  }
}
