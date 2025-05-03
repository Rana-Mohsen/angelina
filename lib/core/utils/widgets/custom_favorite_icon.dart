import 'package:angelina/constants.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/favourite/view_model.dart/favorite_cubit.dart';
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
  // bool isFav = false;

  @override
  Widget build(BuildContext context) {
    bool isFav = widget.product.isFavourite;
    final favoriteCubit = context.read<FavoriteCubit>();
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!isFav) {
            favoriteCubit.addFavorit(widget.product);
          } else {
            favoriteCubit.removeFavorit(widget.product);
          }

          // productsCubit.toggleFavorite(widget.item);

          favoriteCubit.favoritBody();
        });
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
            isFav == true ? Icons.favorite : Icons.favorite_border_outlined,
            size: widget.size,
            color: kGreenColor,
          ),
        ),
      ),
    );
  }
}
