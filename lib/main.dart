import 'package:angelina/core/utils/widgets/custom_navigation_bar.dart';
import 'package:angelina/services/api_service/api.dart';
import 'package:angelina/services/api_service/category.api.dart';
import 'package:angelina/services/api_service/products_api.dart';
import 'package:angelina/views/home/view_model/cubit/category_cubit/categories_cubit.dart';
import 'package:angelina/views/home/view_model/cubit/products_cubit/products_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false, //!kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductsCubit(ProductsApi(Api(Dio()))),
            ),
            BlocProvider(
              create: (context) => CategoriesCubit(CategoryApi(Api(Dio()))),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'ElMessiri',
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
            ),
            home: const CustomNavigationBar(),
          ),
        );
      },
    );
  }
}
