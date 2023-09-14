import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Features/home/presentation/manger/smilar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manger/smilar_books_cubit/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            //MediaQuery kullaninca her ekran boyutuna gore buyuk veya kucuk olacak
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustomBookImage(
                  imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ??
                          ''),
              //  'https://images.pexels.com/photos/15861363/pexels-photo-15861363/free-photo-of-man-posing-with-black-veil.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
              itemCount: state.books.length,
            ),
          ),
        );
      } else if (state is SimilarBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
