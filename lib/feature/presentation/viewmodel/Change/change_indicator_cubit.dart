

import 'package:bookapp/feature/presentation/viewmodel/Change/change_indicator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeIndicatorCubit extends Cubit<ChangeIndicatorState> {
  ChangeIndicatorCubit() : super(ChangeIndicatorInitial());
  static ChangeIndicatorCubit get(context)=>BlocProvider.of(context);
  double sliderValue = 0.0;
  void changed( ){
    sliderValue++;
    sliderValue=sliderValue.clamp(0, 10);
    emit(ChangeIndicator());
  }
}
