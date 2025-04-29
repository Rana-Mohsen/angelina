import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/views/home/widgets/custom_category_listview.dart';
import 'package:angelina/views/home/widgets/custom_home_grid.dart';
import 'package:angelina/views/home/widgets/custom_home_item.dart';
import 'package:angelina/views/home/widgets/custom_slider.dart';
import 'package:angelina/views/home/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(Assets.logo), centerTitle: true),
      drawer: HomeDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomSlider(),
              CustomCategoryListview(),
              // CustomHomeItem(),
              CustomHomeGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
