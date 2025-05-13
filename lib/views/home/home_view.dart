import 'package:angelina/constants.dart';
import 'package:angelina/core/services/local_storage/favorite_storage_service.dart';
import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/models/category/category_model.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/home/more_products_view.dart';
import 'package:angelina/views/home/search_view.dart';
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
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // FavoritesStorageService.clearFavorites();

    if (BlocProvider.of<CategoriesCubit>(context).ctgList.isEmpty) {
      BlocProvider.of<CategoriesCubit>(context).getCategories();
    }
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
      appBar: AppBar(
        title: Image.asset(Assets.logo, height: 7.h),
        centerTitle: true,
        actions: [
          InkWell(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchView()),
                ),
            child: Icon(Icons.search),
          ),
          SizedBox(width: 20),
          Icon(Icons.shopping_cart_outlined),
        ],
        actionsPadding: EdgeInsets.only(right: 16),
      ),
      drawer: HomeDrawer(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomSlider(),
                //CustomCategoryListview(),
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "الاقسام",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          // color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoreProductsView(),
                            ),
                          );
                        },
                        child: Text(
                          "المزيد",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: kGreenColor,
                          ),
                        ),
                      ),
                      Text(
                        "احدث المنتجات",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          // color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
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
                    state is ProductsLoading
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox(),
                    //SizedBox(height: 10.h),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
