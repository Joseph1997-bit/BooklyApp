import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/home/data/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_button.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_item.dart';
import 'featured_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    //ekranin genisligine gore fotonun boyutu ayarlmak icin ve her ekran ayni goruntu vermek icin MediaQuery kullandim

    return SafeArea(
      //CustomScrollView SingleChildScroabble widget'i gibi calisir
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //Creates a sliver that fills the remaining space in the viewport
           //SliverFillRemaining ekranda sadece gozuken seyleri insa edeck
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                   BookDetailsSection(book:bookModel ),
                   BooksAction(bookModel: bookModel,),
                  const SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'You can also like',
                      style: Styles.textStyle16.copyWith(color: Colors.white),
                    ),
                  ),
                  //CustomScrollView widgeti kullandigmiz icin burda Expanda widget hatasiz kullanabilirim
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: SimilarBookListView(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

