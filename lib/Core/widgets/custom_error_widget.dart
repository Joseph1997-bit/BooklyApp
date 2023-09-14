import 'package:bookly_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.errMessage})
      : super(key: key);
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,
      style: Styles.textStyle18,
      textAlign: TextAlign.center,
    );
  }
}
