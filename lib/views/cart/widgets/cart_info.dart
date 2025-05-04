import 'package:angelina/core/utils/widgets/custom_button.dart';
import 'package:angelina/views/cart/view_model/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartInfo extends StatefulWidget {
  const CartInfo({super.key});

  @override
  State<CartInfo> createState() => _CartInfoState();
}

class _CartInfoState extends State<CartInfo> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CartListCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 17.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xff9AADAF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total price", style: TextStyle(fontSize: 20)),
              BlocBuilder<CartListCubit, CartListState>(
                builder: (context, state) {
                  return Text(
                    "\$${bloc.totalPrice}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      //  color: kPrimaryColor,
                    ),
                  );
                },
              ),
            ],
          ),

          CustomButton(text: "إتمام الطلب", onTap: () {}),
        ],
      ),
    );
  }
}
