import 'package:angelina/constants.dart';
import 'package:angelina/errors/failures.dart';
import 'package:angelina/errors/server_failure.dart';
import 'package:angelina/models/category/category_model.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/services/api_service/api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoryApi {
  final Api _api;

  CategoryApi(this._api);

  Future<Either<Failures, dynamic>> fetchCategories() async {
    try {
      var data = await _api.get(
        url:
            "$baseUrl/categories?consumer_key=ck_0e46d6f95c508e91ae3d99f64845cc3b6f5eb5e5&consumer_secret=cs_ab95108f084683daa92f347a81c6d7a5035435ac",
      );

      List<CategoryModel> categories = [];
      for (var ctg in data) {
        categories.add(CategoryModel.fromJson(ctg));
        print(CategoryModel.fromJson(ctg).image.toString());
      }
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures, dynamic>> fetchOneCategory(int categoryId) async {
    try {
      var data = await _api.get(
        url:
            "$baseUrl?category=$categoryId&consumer_key=ck_0e46d6f95c508e91ae3d99f64845cc3b6f5eb5e5&consumer_secret=cs_ab95108f084683daa92f347a81c6d7a5035435ac",
      );

      List<ProductModel> categories = [];
      for (var ctg in data) {
        categories.add(ProductModel.fromJson(ctg));
      }
      print(categories.length);
      return right(categories);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
