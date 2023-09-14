

import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;


  Future<void> fetchFeaturedBooks() async {
    //verileri cekerken Lodaing ozelligi/sinifi gonderiyoruz bu ozelligi baska yerde kullanip Ekranda/uygulamda farkli islemler yapabilriz.Bunlar Bloc ve cubit ozellikleri
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
//result degiskeni turu Either oldugu icin fold fonkisyonu veriyor
    result.fold((failure) {//failure kelimesi yani L(sol) tarafi hangi tur return yapilack
      //eger verileri cekerken bi hata olursa Failure ozelligi/sinifi gonderiyoruz.bu sinifa failure mesaji gonderip ekranda gosterebiliriz.Bunlar Bloc ve cubit ozellikleri
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      //verileri dogru bi sekilde cektikten sonra Success ozelligi/sinifi gonderiyoruz.Bu sinifi kullanip farkli islemler yapabilirz.Bunlar Bloc ve cubit ozellikleri
      emit(FeaturedBooksSuccess(books));

    });
  }

}