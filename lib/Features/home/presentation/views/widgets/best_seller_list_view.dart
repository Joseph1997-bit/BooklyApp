import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Features/home/presentation/manger/newes_books_cubit/newst_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/newes_books_cubit/newst_books_cubit.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit,NewsetBooksState>(
      builder: (context,state) {
       if(state is NewsetBooksSuccess){
         return ListView.builder(
           itemCount: state.books.length,
           //otomatik verilen padding kaldirmak icin asagidaki ozellgi kullandik
    //       padding: EdgeInsets.zero,
           padding: const EdgeInsets.symmetric(vertical: 8),
           //CustomScrollView widgeti kullaninca physics ve shrinkWrap kullanamayiz cunku hata vercek iki widget ayni anda kaydiramzsin
           physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
           itemBuilder: (context, index) {
             return  Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0),
               //birden fazla deger kullanacagimiz icin komple books listesi parametre olarak atmak daha uygundur
               child: BookListViewItem(bookModel: state.books[index]),
             );
           },
         );
       } else   if(state is NewsetBooksFailure) {
         return CustomErrorWidget(errMessage: state.errMessage);
       } else{
         return const CustomLoadingIndicator();
       }
      }
    );
  }
}