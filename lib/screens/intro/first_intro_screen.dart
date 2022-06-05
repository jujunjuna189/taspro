import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/text/medium_text.dart';
import 'package:taspro/widgets/text/small_text.dart';

class FirstIntroScreen extends StatelessWidget {
  const FirstIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundLightPrimaryColor,
      child: Column(
        children: [
          SizedBox(height: Sizes.intense.screenVertical(context) * 15,),
          Container(
            width: Sizes.intense.screenHorizontal(context) * 50,
            height: Sizes.intense.screenVertical(context) * 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/illustrator/task_management.png'),
              ),
            ),
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
          const SmallText(text: "Selamat Datang di",),
          SizedBox(height: Sizes.intense.screenVertical(context) * 1,),
          const MediumText(text: "Task Progress",),
        ],
      ),
    );
  }
}
