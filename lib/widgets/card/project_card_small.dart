import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/text/small_text.dart';

class ProjectCardSmall extends StatelessWidget {
  final String text;
  const ProjectCardSmall({Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.intense.screenHorizontal(context) * 1.5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: Sizes.intense.screenHorizontal(context) * 50,
        decoration: BoxDecoration(
          color: backgroundLightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallText(text: text, fontWeight: FontWeight.bold, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
