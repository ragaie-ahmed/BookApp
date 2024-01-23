import 'package:bookapp/core/utils/Aiservices.dart';
import 'package:bookapp/feature/data/repos/HomeRepoImplementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

   final getIt = GetIt.instance;
   void setup(){
    getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(apiServices:ApiServices(dio: Dio())));
   }
