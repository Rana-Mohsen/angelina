import 'package:angelina/constants.dart';
import 'package:angelina/core/services/notification/notification_service.dart';
import 'package:angelina/views/home/view_model/cubit/search_cubit/cubit/search_cubit.dart';
import 'package:angelina/views/navigation_bar/custom_navigation_bar.dart';
import 'package:angelina/core/services/api_service/api.dart';
import 'package:angelina/core/services/api_service/category_api.dart';
import 'package:angelina/core/services/api_service/products_api.dart';
import 'package:angelina/simple_bloc_observer.dart';
import 'package:angelina/views/cart/view_model/cart_list/cart_list_cubit.dart';
import 'package:angelina/views/favourite/view_model.dart/favorite_cubit.dart';
import 'package:angelina/views/home/view_model/cubit/category_cubit/categories_cubit.dart';
import 'package:angelina/views/home/view_model/cubit/products_cubit/products_cubit.dart';
import 'package:angelina/views/navigation_bar/view_model/cubit/navigation_body_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    DevicePreview(
      enabled: false, //!kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeServices();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  Future<void> _initializeServices() async {
    await NotificationService.initNotification();
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('order_items');
  }

  @override
  Widget build(BuildContext context) {
    var productCubit = ProductsCubit(ProductsApi(Api(Dio())));
    return Sizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => NavigationBodyCubit()),

            BlocProvider(
              create: (context) => productCubit,
            ),
            BlocProvider(
              create: (context) => CategoriesCubit(CategoryApi(Api(Dio()))),
            ),
            BlocProvider(create: (context) => FavoriteCubit()),
            BlocProvider(create: (context) => CartListCubit(productCubit)),
            BlocProvider(create: (context) => SearchCubit(ProductsApi(Api(Dio())))),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
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
