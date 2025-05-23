import 'package:angelina/constants.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/favourite/view_model.dart/favorite_cubit.dart';
import 'package:angelina/views/home/view_model/cubit/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavoriteIcon extends StatefulWidget {
  const CustomFavoriteIcon({
    super.key,
    this.size = 21,
    this.padding = 6,
    required this.product,
  });

  final ProductModel product;
  final double? size;
  final double padding;

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.read<FavoriteCubit>();
    final productsCubit = context.read<ProductsCubit>();

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        bool isFav = widget.product.isFav;

        return GestureDetector(
          onTap: () async {
            if (!isFav) {
              await favoriteCubit.addFavorit(widget.product);
            } else {
              await favoriteCubit.removeFavorit(widget.product);
            }
            productsCubit
                .toggleFavorite(); // Ensure products list refreshes too

            /// **Important:** Trigger a UI refresh by fetching the latest favorite list
            await favoriteCubit.favoritBody();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(widget.padding),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border_outlined,
                size: widget.size,
                color: kGreenColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
