import 'package:angelina/views/home/view_model/cubit/search_cubit/cubit/search_cubit.dart';
import 'package:angelina/views/home/widgets/custom_home_grid.dart';
import 'package:angelina/views/home/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
                BlocProvider.of<SearchCubit>(context).init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("البحث")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: SearchTextfield(
              onChange: (value) {
                BlocProvider.of<SearchCubit>(context).searchProducts(value);
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchError) {
                  return Center(child: Text(state.errMessage));
                } else if (state is SearchEmpty) {
                  return const Center(child: Text("المنتج غير موجود"));
                } else if (state is SearchChanged) {
                  return CustomHomeGrid(
                    products: state.searchedProducts,
                    scroll: true,
                  );
                }
                return const Center(child: Text("ابدأ البحث عن المنتجات!"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
