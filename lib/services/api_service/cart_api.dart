
// import 'package:angelina/errors/failures.dart';
// import 'package:angelina/errors/server_failure.dart';
// import 'package:angelina/services/api_service/api.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class CartApi {
//   final Api _api;
//   final String baseUrl = "https://zbooma.com/furniture_api/cart/";

//   CartApi(this._api);

//   Future<Either<Failures, dynamic>> addToCart(Map<String, dynamic> body) async {
//     try {
//       var data = await _api.post(url: "${baseUrl}cart.php", body: body);
//       print(body);

//       print(data);

//       if (data["status"] == "success") {
//         return right(data);
//       } else {
//         print("0000");
//         return left(ServerFailure(data["message"]));
//       }
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }

//   Future<Either<Failures, dynamic>> editCart(
//     String userId,
//     Map<String, dynamic> body,
//   ) async {
//     try {
//       var data = await _api.put(
//         url: "${baseUrl}cart.php?user_id=$userId",
//         body: body,
//       );
//       return right(data);
//     } catch (e) {

//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }

//       return left(ServerFailure(e.toString()));
//     }
//   }

//   Future<Either<Failures, List<CartModel>>> getItemCart(String userId) async {
//     try {
//       var data = await _api.get(url: "${baseUrl}cart.php?user_id=$userId");
//       print("Cart returned DATA: $data");

//       List<CartModel> cartList = [];

//       for (var item in data['cart']) {
//         cartList.add(CartModel.fromJson(item));
//       }
//       if (data["status"] == "success") {
//         return right(cartList);
//       } else {
//         return left(ServerFailure(data["message"]));
//       }
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }

//   Future<Either<Failures, dynamic>> deleteCartItem(
//     String userId,
//     Map<String, dynamic> body,
//   ) async {
//     try {
//       var data = await _api.delete(
//         url: "${baseUrl}cart.php?user_id=$userId",
//         body: body,
//       );

//       return right(data);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }
// }
