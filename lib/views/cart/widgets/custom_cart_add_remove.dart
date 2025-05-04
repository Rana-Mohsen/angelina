import 'package:angelina/constants.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/cart/view_model/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CustomCartAddRemove extends StatefulWidget {
  final ProductModel item;

  const CustomCartAddRemove({super.key, required this.item});

  @override
  State<CustomCartAddRemove> createState() => _CustomCartAddRemoveState();
}

class _CustomCartAddRemoveState extends State<CustomCartAddRemove> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CartListCubit>(context);
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
              bloc.decreaseProductCart(widget.item);
            },
          ),
          Flexible(
            child: BlocBuilder<CartListCubit, CartListState>(
              builder: (context, state) {
                if (state is CartCountLoading &&
                    state.loadingProductIds.contains(widget.item.id)) {
                  print("loaaaaaaaadine");
                  return CircularProgressIndicator();
                }
                return Text(
                  widget.item.count.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff8D9391),
                  ),
                );
              },
            ),
          ),
          customCountIcon(
            icon: Icons.add,
            onPressed: () {
              bloc.increaseProductCart(widget.item);
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
