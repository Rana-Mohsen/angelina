import 'package:angelina/constants.dart';
import 'package:flutter/material.dart';

class CustomFavoriteIcon extends StatefulWidget {
  const CustomFavoriteIcon({super.key, this.size = 21, this.padding = 6});

  final double? size;
  final double padding;

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFav = !isFav;
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
            color: Color(kGreenColor),
          ),
        ),
      ),
    );
  }
}
