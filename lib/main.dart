import 'package:angelina/core/utils/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'ElMessiri',
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
          ),
          home: const CustomNavigationBar(),
        );
      },
    );
  }
}
