import 'package:bookly_app/Core/utils/api_router.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../data/book_model/book_model.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kBookDetailsView,
            extra: bookModel
            );
          },
          child: SizedBox(
            height: 125,
            child: AspectRatio(
              aspectRatio: 2.6 / 4,
              child: CustomBookImage(
                //eger image deger null gelirse bos deger versin ve hata widget gostereck CachedNetworkImage sayesinde
                  imageUrl: bookModel.volumeInfo.imageLinks?.smallThumbnail ?? ' ' ),
            ),
          ),
        ),
        const SizedBox(width: 30),
        //Bu Colum'a Expanded widgeti verdik asagidaki yildiz ikonu sag tarafta koymak icin
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                //ekranlarin genisligi degisebilir  Oyuzden MediaQuery kullnmamiz gerekiyo
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  bookModel.volumeInfo.title!,
                  style: Styles.textStyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 3),
              Text(bookModel.volumeInfo.authors![0],
                  style: Styles.textStyle16.copyWith(
                    color: const Color(0xff707070),
                  )),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Free €',
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold)),
                  BookRating(
                    count: bookModel.volumeInfo.ratingsCount ?? 4,
                    rating: bookModel.volumeInfo.averageRating ?? 3,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
