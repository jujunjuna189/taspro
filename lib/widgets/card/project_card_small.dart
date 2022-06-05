import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';

class ProjectCardSmall extends StatelessWidget {
  const ProjectCardSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.intense.screenHorizontal(context) * 1.5),
      child: Container(
        width: Sizes.intense.screenHorizontal(context) * 50,
        decoration: BoxDecoration(
          color: backgroundLightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
