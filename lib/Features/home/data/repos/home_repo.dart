import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../book_model/book_model.dart';
//abstract siniflarindan object/nesne olusturamazsin
//Repo pattern/sinifi:abstract sinifi olusturup icindeki methodlar ne is yapacagini belirleyebiliriz ama nasil yapilack belirlemiyoz cunku bi suru yontem var
abstract class HomeRepo {
  //istek atarken eger hata olursa Failure sinifi veya deger doneck bu islem dartz: paketi sayesinde yapabiliriz
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();//verileri cektikten sonra List of booksModel olarak bir deger dondurur
 //Categoriye gore search yapilacak
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
     {required String category});
}