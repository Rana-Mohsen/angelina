import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/models/category/category_model.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/home/view_model/cubit/category_cubit/categories_cubit.dart';
import 'package:angelina/views/home/view_model/cubit/products_cubit/products_cubit.dart';
import 'package:angelina/views/home/widgets/custom_category_listview.dart';
import 'package:angelina/views/home/widgets/custom_home_grid.dart';
import 'package:angelina/views/home/widgets/custom_home_item.dart';
import 'package:angelina/views/home/widgets/custom_slider.dart';
import 'package:angelina/views/home/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
     if (BlocProvider.of<CategoriesCubit>(context).ctgList.isEmpty) {
      BlocProvider.of<CategoriesCubit>(context).getCategories();
    }
    if (BlocProvider.of<ProductsCubit>(context).productList.isEmpty) {
      BlocProvider.of<ProductsCubit>(context).getProducts();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(Assets.logo),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
          SizedBox(width: 20),
          Icon(Icons.shopping_cart_outlined),
        ],
        actionsPadding: EdgeInsets.only(right: 16),
      ),
      drawer: HomeDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomSlider(),
                //CustomCategoryListview(),
                BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CategoriesError) {
                  return Text(state.errMessage);
                }
                List<CategoryModel> categories =
                    BlocProvider.of<CategoriesCubit>(context).ctgList;

                return CustomCategoryListview(categories: categories);
              },
            ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductsError) {
                  return Text(state.errMessage);
                }
                List<ProductModel> products =
                    BlocProvider.of<ProductsCubit>(context).productList;

                return CustomHomeGrid(products: products);
              },
            ),
          ),
        ],
      ),
    );
  }
}
