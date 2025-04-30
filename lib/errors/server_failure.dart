import 'package:angelina/errors/failures.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioExp) {
    switch (dioExp.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        // print("1");
        return ServerFailure.fromResponse(
          dioExp.response!.statusCode,
          dioExp.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.connectionError:
        print(DioExceptionType.connectionError);
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400) {
      return ServerFailure(response['message']);
    } else if (statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 409) {
      return ServerFailure(response['errors']['email']);
    } else if (statusCode == 500) {
      return ServerFailure('user name already exists');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
