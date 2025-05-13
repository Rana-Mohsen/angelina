import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  final Dio _dio;

  Api(this._dio);

  Future<dynamic> get({required String url, String? token}) async {
    Options options = Options(
      headers: token != null ? {"Authorization": "Bearer $token"} : {},
    );
    Response response = await _dio.get(url, options: options);
    return response.data;
  }
 
  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
     String? username,
    String? password,

  }) async {
Options options = Options(
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );    Response response = await _dio.post(url, data: body, options: options);
    return response.data;
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Options options = Options(
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );
    Response response = await _dio.put(url, data: body, options: options);
    return response.data;
  }

  Future<dynamic> delete({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Options options = Options(
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );
    Response response = await _dio.delete(url, data: body, options: options);
    return response.data;
  }

  searchProducts(String searchWord) {}
}
