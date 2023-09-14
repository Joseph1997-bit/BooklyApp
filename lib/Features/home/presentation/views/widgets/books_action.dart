import 'package:bookly_app/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';


import '../../../../../Core/utils/function/launch_url.dart';
import '../../../data/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
                fontSize: 17,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                text: 'Free',
                onPressed: () {},
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(12))),
          ),
          Expanded(
            child: CustomButton(
              fontSize: 17,
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              text: 'Preview',
              onPressed: () async {
           //     Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
              await  launchCustomUr(context,bookModel.volumeInfo.previewLink!);
              },
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
