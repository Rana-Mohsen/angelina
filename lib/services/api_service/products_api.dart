
import 'package:angelina/constants.dart';
import 'package:angelina/errors/failures.dart';
import 'package:angelina/errors/server_failure.dart';
import 'package:angelina/services/api_service/api.dart';
import 'package:angelina/views/home/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProductsApi {
  final Api _api;
  ProductsApi(this._api);

  Future<Either<Failures, List<ProductModel>>> getProducts() async {
    try {
      var data = await _api.get(url: "$baseUrl?category=20&consumer_key=ck_0e46d6f95c508e91ae3d99f64845cc3b6f5eb5e5&consumer_secret=cs_ab95108f084683daa92f347a81c6d7a5035435ac");

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
