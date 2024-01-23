import 'package:bookapp/feature/domain/BookModel.dart';

abstract class FetchNewBookState{}
class FetchNewBookinit extends FetchNewBookState{}
class FetchNewBookLoading extends FetchNewBookState{}
class FetchNewBookLoaded extends FetchNewBookState{
  final List<BookModel> book;

  FetchNewBookLoaded({required this.book});
}
class FetchNewBookError extends FetchNewBookState{
  final String error;

  FetchNewBookError({required this.error});

}