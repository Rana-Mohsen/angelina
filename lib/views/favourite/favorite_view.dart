import 'package:angelina/core/utils/functions/snack_bar.dart';
import 'package:angelina/core/widgets/custom_button.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/cart/view_model/cart_list/cart_list_cubit.dart';
import 'package:angelina/views/favourite/view_model.dart/favorite_cubit.dart';
import 'package:angelina/views/favourite/widgets/custom_favorite_product.dart';
import 'package:angelina/views/home/view_model/cubit/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  late FavoriteCubit favoriteCubit;

  @override
  void initState() {
    super.initState();
    favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    favoriteCubit.favoritBody();
  }

  @override
  Widget build(BuildContext context) {
    var productsCubit = BlocProvider.of<ProductsCubit>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("المفضلة")),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteChanged) {
            return FutureBuilder<List<ProductModel>>(
              future: favoriteCubit.getFavorites(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("You have no favorite items"),
                  );
                }

                final favList = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: favList.length,
                          separatorBuilder: (_, __) => const SizedBox(),
                          itemBuilder:
                              (context, index) => CustomFavoriteProduct(
                                product: favList[index],
                              ),
                        ),
                      ),
                      SizedBox(
                        child: CustomButton(
                          onTap: ()  {
                            for (var favItem in favList) {
                              BlocProvider.of<CartListCubit>(
                                context,
                              ).addProductToCart(favItem);
                              // productsCubit.updateProductButton(
                              //   favItem.id,
                              //   !favItem.buttonEnabled,
                              // );
                              // favItem.buttonEnabled = false;
                              // await FavoritesStorageService.saveFavorites(
                              //   favList,
                              // );
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
              },
            );
          }
          return const Center(child: Text("You have no favorite items"));
        },
      ),
    );
  }
}
