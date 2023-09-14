import 'package:bookly_app/Core/utils/api_router.dart';
import 'package:bookly_app/Core/utils/api_service.dart';
import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manger/newes_books_cubit/newst_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:google_fonts/google_fonts.dart';

import 'Features/Splash/presentation/view/splash_view.dart';
import 'constants.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //ApiServise sayfasinda veya baska yerde herhangi bir degisme olursa getIt kullandigmiz icin burda herhangi bi seye yapmamiz gerekmiyor
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
            //NewsetBooksCubit metodu inşa  etikten sonra iki noktayla metodu calistirmak icin kullanilir initState kullanmadan
          )..fetchFeaturedBooks(),
          //bir nokta koysaydik FeaturedBooksCubit metodundan gelen return degeri calisack
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        //hangi sayfa ilk olarak acilack diye AppRouter sinifinda belirlenmis
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.abyssinicaSilTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
