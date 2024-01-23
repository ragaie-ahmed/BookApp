import 'package:bloc/bloc.dart';
import 'package:bookapp/core/Constant/Bloc_Observe.dart';
import 'package:bookapp/core/utils/Aiservices.dart';
import 'package:bookapp/core/utils/Service_Locator.dart';
import 'package:bookapp/feature/data/repos/HomeRepoImplementation.dart';
import 'package:bookapp/feature/presentation/Onboarding/onboardingbody.dart';
import 'package:bookapp/feature/presentation/view/HomeScreen.dart';
import 'package:bookapp/feature/presentation/view/Widget/ChangeIndicator.dart';
import 'package:bookapp/feature/presentation/viewmodel/FetchBestBook/fetch_best_box_cubit.dart';
import 'package:bookapp/feature/presentation/viewmodel/fetch_newestbook_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchNewestbookCubit(
   getIt.get<HomeRepoImplementation>()
          )..fetchdatanew(),
        ),
        BlocProvider(create: (context) => FetchBestBoxCubit(
getIt.get<HomeRepoImplementation>()
        ),)
      ],
      child: GetMaterialApp(
        home: MySliderScreenApp(),
      ),
    );
  }
}
