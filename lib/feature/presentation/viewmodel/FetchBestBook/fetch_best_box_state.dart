
import 'package:bookapp/feature/domain/BookModel.dart';

abstract class FetchBestBoxState {}

class FetchBestBoxInitial extends FetchBestBoxState {}
class FetchBestBoxLoading extends FetchBestBoxState {}
class FetchBestBoxLoaded extends FetchBestBoxState {
  // final List<BookModel> books;
  //
  // FetchBestBoxLoaded({required this.books});
}
class FetchBestBoxError extends FetchBestBoxState {
  final String error;

  FetchBestBoxError({required this.error});

}
