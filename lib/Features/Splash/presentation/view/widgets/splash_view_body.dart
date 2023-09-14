import 'package:bookly_app/Features/Splash/presentation/view/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/api_router.dart';
import '../../../../../Core/utils/assets.dart';
import '../../../../../constants.dart';
import '../../../../home/presentation/views/home_view.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();//ilk sayfada animasyonu calistirmak icin
    navigateToHome();//animasyondan sonra ana sayfaya gitmek icin kullanilir
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsData.logo,
            height: 50,
            width: 50,
          ),
          const SizedBox(height: 15),
          SlidingText(slidingAnimation: slidingAnimation)
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController.forward();
    //begin degerine asagidan yukraiya gidecgi icin x degere 0 ve y degerine 2 verdik.End ozlligne text yerine gecmesi icin sifir verdik
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero).animate(
            animationController); //animation turune cevirip ve calistiran tipp animationController olack
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        //iki saniye sonra asagidki kodu calisacak
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
