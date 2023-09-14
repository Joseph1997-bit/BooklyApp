import 'package:bookly_app/Features/home/data/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/manger/smilar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    //bu metod sadece bu sayfada ihtiyacimiz oldugu icin ayni sayfada calistirmasi daha uygun
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsViewBody(bookModel:widget.bookModel),
    );
  }
}
