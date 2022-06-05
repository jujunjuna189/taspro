import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/text/big_text.dart';
import 'package:taspro/widgets/text/small_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 2), (){
      Navigator.of(context).pushNamed("/auth");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Sizes.intense.screenVertical(context) * 15,),
            const BigText(text: "TASPRO",),
            SizedBox(height: Sizes.intense.screenVertical(context) * 30,),
            const CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color>(backgroundBlackColor),
            ),
            SizedBox(height: Sizes.intense.screenVertical(context) * 10,),
            const SmallText(text: "Versi 1.26.0"),
          ],
        ),
      ),
    );
  }
}
