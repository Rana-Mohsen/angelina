
// import 'package:angelina/errors/failures.dart';
// import 'package:angelina/services/api_service/api.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class CategoryApi {
//   final Api _api;
//   final String baseUrl = "https://zbooma.com/furniture_api/categories/";

//   CategoryApi(this._api);

//   Future<Either<Failures, dynamic>> getCategories() async {
//     try {
//       var data = await _api.get(url: "${baseUrl}get_categories.php");
//       List<CategoryModel> categories = [];
//       for (var ctg in data['categories']) {
//         categories.add(CategoryModel.fromJson(ctg));
//       }
//       return right(categories);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }
// }
