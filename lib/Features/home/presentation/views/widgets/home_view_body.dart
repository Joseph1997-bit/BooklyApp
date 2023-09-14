
import 'package:bookly_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view.dart';

import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //CustomScrollView yerine Single widgeti kullandim cunku ListView itemlari hepsi gozukmez.bestSeller kismindan bahsediyom
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),//asagidan listyi cekine renk yerine BouncingScroll ozelligi ekleycz
      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomAppBar(),
              ),
              FeaturedBookListView(),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('Best Seller', style: Styles.textStyle20),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: BestSellerListView(),
              ),
            ],
          ),
          //SliverFillRemaining ekranda sadece gozuken seyleri insa edeck


    );
  }
}


