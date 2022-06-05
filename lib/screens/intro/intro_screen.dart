import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taspro/screens/intro/first_intro_screen.dart';
import 'package:taspro/screens/intro/second_intro_screen.dart';
import 'package:taspro/screens/intro/third_intro_screen.dart';
import 'package:taspro/widgets/text/small_text.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _dotController = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _dotController,
            onPageChanged: ((value){
              setState((){
                onLastPage = (value == 2);
              });
            }),
            children: const [
              FirstIntroScreen(),
              SecondIntroScreen(),
              ThirdIntroScreen(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: ((){
                      _dotController.jumpToPage(2);
                    }),
                    child: const SmallText(text: "Skip"),
                  ),
                  SmoothPageIndicator(controller: _dotController, count: 3, effect: const SlideEffect(dotWidth: 10, dotHeight: 10),),
                  !onLastPage ? GestureDetector(
                      onTap: ((){
                        _dotController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }),
                      child: const SmallText(text: "Next"),
                    )
                  : GestureDetector(
                    onTap: ((){
                      Navigator.of(context).pushNamed("/splash");
                    }),
                    child: const SmallText(text: "Selesai"),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
