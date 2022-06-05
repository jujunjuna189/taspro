import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';

class TaskCardSmall extends StatelessWidget {
  const TaskCardSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Sizes.intense.screenVertical(context) * 1.5),
      child: Container(
        height: Sizes.intense.screenVertical(context) * 10,
        width: Sizes.intense.screenHorizontal(context) * 50,
        decoration: BoxDecoration(
          color: backgroundLightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
