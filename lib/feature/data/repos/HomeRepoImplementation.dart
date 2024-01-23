import 'package:bookapp/core/failuer/failuer.dart';
import 'package:bookapp/core/utils/Aiservices.dart';
import 'package:bookapp/feature/data/repos/HomeReps.dart';
import 'package:bookapp/feature/domain/BookModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepos {
  final ApiServices apiServices;

  HomeRepoImplementation({required this.apiServices});

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestBook() async{
    try {
      var data = await apiServices.get(
          "volumes?Filtering=free-ebooks&q=computer science");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewBook() async {
    try {
      var data = await apiServices.get(
          "volumes?Filtering=free-ebooks&Sorting=newest &q=computer science");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }


}
