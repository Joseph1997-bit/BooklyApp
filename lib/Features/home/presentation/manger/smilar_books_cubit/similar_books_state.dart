

import 'package:equatable/equatable.dart';

import '../../../data/book_model/book_model.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();
  @override//bu override yapmamiz gerekiyo yoksa hata veriyo cunku Equatable paketi kullandim
  List<Object> get props => [];
}

//asagidaki siniflari state belirlemek icin kullanacz emit ile
class SimilarBooksInitial extends SimilarBooksState {}

//failureden gelen mesaji buraya atiyoruz ve Bloc widgetlari icindeki state kelimsei kullanarak ulasabiliriz
class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailure(this.errMessage);
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilarBooksState {}