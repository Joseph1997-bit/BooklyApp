import 'package:bookly_app/Core/utils/api_router.dart';
import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../Core/widgets/custom_loading_indicator.dart';
import 'custom_book_item.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        //eger state Success durum emit/verirse yani basarili bi sekilde verileri cektik
        if (state is FeaturedBooksSuccess) {
          //FeaturedBooksSuccess sinifin icindeki kurdugmuz books listesi state ile ulasip ekranda calistirabilirz
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              //MediaQuery kullaninca her ekran boyutuna gore buyuk veya kucuk olacak
              height: MediaQuery.of(context).size.height * .33,
              child: ListView.separated(
                physics:
                    const BouncingScrollPhysics(), //soldan cekince renk yerine itemleri cekme ozelligi ekliyoruz
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,
                        extra: state.books[index]);
                  },
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            '',
                  ),
                ),
                itemCount: state.books.length,
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
