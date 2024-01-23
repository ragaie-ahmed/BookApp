import 'package:bookapp/core/failuer/failuer.dart';
import 'package:bookapp/feature/domain/BookModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepos{
 Future <Either<Failure,List<BookModel>>> fetchNewBook();
 Future <Either<Failure,List<BookModel>>> fetchBestBook();

}