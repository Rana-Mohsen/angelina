import 'package:angelina/constants.dart';
import 'package:angelina/errors/failures.dart';
import 'package:angelina/errors/server_failure.dart';
import 'package:angelina/models/order_requist_model.dart';
import 'package:angelina/services/api_service/api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OrderApi {
  final Api _api;

  OrderApi(this._api);

  Future<Either<Failures, dynamic>> sendOrder(OrderRequest body) async {
    try {
      var data = await _api.post(url: "${baseUrl}orders?consumer_key=ck_0e46d6f95c508e91ae3d99f64845cc3b6f5eb5e5&consumer_secret=cs_ab95108f084683daa92f347a81c6d7a5035435ac", body: body,);
      // print("========>>>>>");
      // print(data);

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}
