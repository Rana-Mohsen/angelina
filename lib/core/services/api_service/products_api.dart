import 'package:angelina/constants.dart';
import 'package:angelina/errors/failures.dart';
import 'package:angelina/errors/server_failure.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/core/services/api_service/api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html;

class ProductsApi {
  final Api _api;
  ProductsApi(this._api);

  Future<Either<Failures, List<ProductModel>>> getProducts(int page) async {
    try {
      var data = await _api.get(
        url:
            "${baseUrl}products?per_page=10&page=$page&consumer_key=ck_0e46d6f95c508e91ae3d99f64845cc3b6f5eb5e5&consumer_secret=cs_ab95108f084683daa92f347a81c6d7a5035435ac",
      );

      List<ProductModel> products = [];
      for (var ctg in data) {
        var product = ProductModel.fromJson(ctg);
        products.add(product);
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failures, List<ProductModel>>> searchProducts(String search) async {
    try {
      var data = await _api.get(
        url:
            "${baseUrl}products?search=$search&per_page=100&consumer_key=ck_0e46d6f95c508e91ae3d99f64845cc3b6f5eb5e5&consumer_secret=cs_ab95108f084683daa92f347a81c6d7a5035435ac",
      );

      List<ProductModel> products = [];
      for (var ctg in data) {
        var product = ProductModel.fromJson(ctg);
        products.add(product);
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
