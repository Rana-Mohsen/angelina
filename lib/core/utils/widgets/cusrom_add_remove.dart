import 'package:angelina/constants.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CustomAddRemove extends StatefulWidget {
  //final ProductModel item;

  const CustomAddRemove({
    super.key,

    // required this.item,
  });

  @override
  State<CustomAddRemove> createState() => _CustomAddRemoveState();
}

class _CustomAddRemoveState extends State<CustomAddRemove> {
  @override
  Widget build(BuildContext context) {
    //var bloc = BlocProvider.of<CartListCubit>(context);
    return Container(
      padding: EdgeInsets.all(0.5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            //blurRadius: 2,
            color: Colors.black.withAlpha(20),
            spreadRadius: 1.5,
          ),
        ],
      ),
      child: Row(
        //spacing: 2.w,
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          customCountIcon(
            icon: Icons.remove,
            onPressed: () {
              setState(() {
                //  widget.item.count++;

                // bloc.cartTotalPrice();
              });
            },
          ),
          Flexible(
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff8D9391),
              ),
            ),
          ),
          customCountIcon(
            icon: Icons.add,
            onPressed: () {
              // if (widget.item.count > 0) {
              //   setState(() {
              //      widget.item.count--;
              //     if (widget.item.count == 0) {
              //       // bloc.removeItem(widget.item.name, widget.item);
              //     }
              //     bloc.cartTotalPrice();
              //   });
              // }
            },
          ),
        ],
      ),
    );
  }

  Widget customCountIcon({
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return Flexible(
      child: InkWell(
        onTap: onPressed,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Icon(icon, color: kGreenColor),
        ),
      ),
    );
  }
}
