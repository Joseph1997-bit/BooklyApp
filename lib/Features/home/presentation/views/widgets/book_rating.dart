import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({Key? key, required this.rating, required this.count})
      : super(key: key);
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            '$rating',
            style: Styles.textStyle20,
          ),
        ),
        Text(
          '($count)',
          style:
              Styles.textStyle18.copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      ],
    );
  }
}
