import 'package:bookly_app/Features/home/data/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .28),
          child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ''),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 10),
          child: Text(
            book.volumeInfo.title!,
            style: Styles.textStyle30,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow:TextOverflow.ellipsis,
          ),
        ),
        Opacity(
            opacity: 0.6,
            child: Text(
              book.volumeInfo.authors![0],
              style: Styles.textStyle18.copyWith(color: Colors.white),
            )),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 35),
          child: BookRating(count: 5, rating: 54),
        ),
      ],
    );
  }
}
