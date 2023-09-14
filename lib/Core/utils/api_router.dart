import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/view/splash_view.dart';
import '../../Features/home/data/book_model/book_model.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/presentation/manger/smilar_books_cubit/similar_books_cubit.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/search_view.dart';

abstract class AppRouter {
  //sayfanin adisini yazmadan once / bu isareti koymamiz lazim
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      //  uygulama ilk sayfa SplashView sayfasi acilack
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      //herhangi bi sayfaya gitmek istiyorsak sayfanin path degeri vermemz lazim
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),

      GoRoute(
        path: kBookDetailsView,
        //SimilarBooksCubit sadece BookDetailsView icinde var ve kullanabilirz baska yerde ihtiyacimiz yok ondan boyle yaptik
        builder: (context, state) => BlocProvider(//BlocProvider ile bir Cubit sinifi insal edebilirz
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            //Navigation yaparak state.extra bunu kullanarak bir sayfaya bilgi gonderebilirz BookModel degerleri gibi
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
