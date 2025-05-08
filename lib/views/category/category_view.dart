import 'package:angelina/models/category/category_model.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/home/view_model/cubit/category_cubit/categories_cubit.dart';
import 'package:angelina/views/home/widgets/custom_home_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.ctg});
  final CategoryModel ctg;
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    BlocProvider.of<CategoriesCubit>(context).getOneCategory(widget.ctg.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.ctg.name)),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is OneCategoryError) {
            return Text(state.errMessage);
          }
          // List<ProductModel> products =
          //     context.read<ProductsCubit>().productList;
          // bool isLoading = context.read<ProductsCubit>().isLoading;
          else if (state is OneCategorySuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomHomeGrid(products: state.ctg),
                  // state is ProductsLoading
                  //     ? Center(child: CircularProgressIndicator())
                  //     : SizedBox(),
                  // SizedBox(height: 10.h),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
