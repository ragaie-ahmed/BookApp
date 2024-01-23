

import 'package:bookapp/feature/data/repos/HomeReps.dart';
import 'package:bookapp/feature/presentation/viewmodel/fetch_newestbook_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchNewestbookCubit extends Cubit<FetchNewBookState> {
  FetchNewestbookCubit(this.homeRepos) : super(FetchNewBookinit());
  static FetchNewestbookCubit get(context)=>BlocProvider.of(context);
final  HomeRepos homeRepos;
Future<void> fetchdatanew()async{
  emit(FetchNewBookLoading());
  var req=await homeRepos.fetchNewBook();
  req.fold((failure) {
    emit(FetchNewBookError(error:failure.error ));
  }, (data) {
    emit(FetchNewBookLoaded(book: data));
  });
}
}
