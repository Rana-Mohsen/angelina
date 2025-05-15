import 'package:angelina/models/category/category_model.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/home/view_model/cubit/category_cubit/categories_cubit.dart';
import 'package:angelina/views/home/view_model/cubit/products_cubit/products_cubit.dart';
import 'package:angelina/views/home/widgets/custom_home_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.ctg});
  final CategoryModel ctg;
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(loadMoreData);

    BlocProvider.of<CategoriesCubit>(context).getOneCategory(widget.ctg.id);
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
      appBar: AppBar(title: Text(widget.ctg.name)),
      body: SingleChildScrollView(
        controller: scrollController,

        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is OneCategoryError) {
              return Text(state.errMessage);
            }
            List<ProductModel> products =
                context.read<CategoriesCubit>().ctgProductList;
            bool isLoading = context.read<CategoriesCubit>().isLoading;

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
      BlocProvider.of<CategoriesCubit>(context).getOneCategory(widget.ctg.id);
    }
  }
}
