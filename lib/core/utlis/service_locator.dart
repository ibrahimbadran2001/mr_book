import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mr_book/core/utlis/api_service.dart';
import 'package:mr_book/features/home/repos/home_repo_impl.dart';

final getIt= GetIt.instance;

void setUp(){
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>()
    ),
  );
}