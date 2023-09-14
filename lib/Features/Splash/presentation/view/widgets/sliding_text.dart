import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    //tum UI'yi rebuild etmiyotuz sadece Text widget rebuil edecz oYuzden AnimatedBuilder widget'i kullandik
    return AnimatedBuilder(
        //the animation property will listen to the slidingAnimation variable
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
              position: slidingAnimation, child: const Text('Read Free Books'));
        });
  }
}
