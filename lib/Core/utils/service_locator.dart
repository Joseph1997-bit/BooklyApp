import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton(
    ApiService(
      Dio(),
    ),
  ); //farkli yerlerde ayni ApiService kullanacagimiz icin bi yerde olusturup onu kullanabiliriz
  //getIt sayesinde herhangi bir degisme olursa gidip main sayfasinda tum metodlari degistirmek zorunda kalmayacz direkt burdan degistirebilirz
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
