import 'package:angelina/models/home/product_model.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

const kGreenColor = Color(0xff0C3A3F);
const String baseUrl = "https://angelinashop2025.com/wp-json/wc/v3/";
//List<ProductModel> favList = [];
List<ProductModel> cartList = [];
