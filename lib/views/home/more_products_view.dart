import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/home/view_model/cubit/products_cubit/products_cubit.dart';
import 'package:angelina/views/home/widgets/custom_home_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MoreProductsView extends StatefulWidget {
  const MoreProductsView({super.key});

  @override
  State<MoreProductsView> createState() => _MoreProductsViewState();
}

class _MoreProductsViewState extends State<MoreProductsView> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(loadMoreData);

    if (BlocProvider.of<ProductsCubit>(context).productList.isEmpty) {
      BlocProvider.of<ProductsCubit>(context).getProducts();
    }
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المنتجات"), centerTitle: true),
      body: SingleChildScrollView(
        controller: scrollController,

        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsError) {
              return Text(state.errMessage);
            }
            List<ProductModel> products =
                context.read<ProductsCubit>().productList;
            bool isLoading = context.read<ProductsCubit>().isLoading;
            return Column(
              children: [
                CustomHomeGrid(products: products),
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(),
                SizedBox(height: 10.h),
              ],
            );
          },
        ),
      ),
    );
  }

  loadMoreData() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      BlocProvider.of<ProductsCubit>(context).getProducts();
    }
  }
}
