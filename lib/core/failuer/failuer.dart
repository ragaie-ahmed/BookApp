import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failure{
  final String error;

  Failure({required this.error});

}
class ServerFailure extends Failure{
  ServerFailure({required super.error});
  factory ServerFailure.fromDioError(DioException dioException){
    switch(dioException.type){
      case DioExceptionType.connectionTimeout:
        return ServerFailure(error: 'Connection timeout with ApiServer');
      case DioExceptionType.cancel:
        return ServerFailure(error: 'cancel timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(error: "Bad Request");

      default:
        if(dioException.response!=null){
          ServerFailure.fromResponse(dioException.response!.statusCode, dioException.response!.data);
        }
        if(dioException.message!.contains("SocketException")){
          ServerFailure(error: "No Internet Connection");
        }
      return  ServerFailure(error: 'Unexpected Error, Please try again!');

    }



  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(error:  response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(error: 'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure(error:  'Internal Server error, Please try later');
    } else {
      return ServerFailure(error:  'Opps There was an Error, Please try again');
    }
  }


}
