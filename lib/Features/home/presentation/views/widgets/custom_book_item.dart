import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //ClipRRect widget'i borderRadius eklemek icin kullandik
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: CachedNetworkImage(//guzel bi paket imageUrl gostermek icin kullanilir
          // ve eger Api'de hata varsa ayru bu widget gosterck ve beklemek icin CircleProgress gosterebilir
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) =>
              const Icon(Icons.error, size: 30),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
