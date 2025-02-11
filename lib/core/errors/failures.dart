import 'package:dio/dio.dart';

abstract class Failure{
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure{
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioException(DioException e){
    switch(e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with ApiServer!');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with ApiServer!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with ApiServer!');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate with ApiServer!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request  to ApiServer was canceled!');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No Internet Connection!');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'Unexpected error, please try later!');
        default:
          return ServerFailure(errMessage: 'Oops, there was an error, please try later!');
    }
  }
  factory ServerFailure.fromBadResponse(int statusCode,dynamic response){
    if(statusCode==400 || statusCode==401 || statusCode==403){
      return ServerFailure(errMessage: response['errors']['message']);
    }else if (statusCode==404){
      return ServerFailure(errMessage: 'Your request not found, please try later!');
    }else if (statusCode==500){
      return ServerFailure(errMessage: 'Internal Server error, please try later!');
    }else{
      return ServerFailure(errMessage: 'Oops, there was an error, please try later!');
    }
  }
}

