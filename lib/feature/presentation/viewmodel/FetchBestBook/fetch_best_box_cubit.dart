


import 'package:bookapp/feature/data/repos/HomeReps.dart';
import 'package:bookapp/feature/domain/BookModel.dart';
import 'package:bookapp/feature/presentation/viewmodel/FetchBestBook/fetch_best_box_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBestBoxCubit extends Cubit<FetchBestBoxState> {
  FetchBestBoxCubit(this.homeRepos) : super(FetchBestBoxInitial());
  static FetchBestBoxCubit get(context)=> BlocProvider.of(context);

  final HomeRepos homeRepos;
  List<BookModel> boo=[];
  Future <void>fetchBestBox()async{
    var req=await homeRepos.fetchBestBook();
    req.fold((failure){
      emit(FetchBestBoxError(error: failure.error));
    }, (data) {
      boo.add(data as BookModel);
      emit(FetchBestBoxLoaded());
    });
    
    
  }
}
