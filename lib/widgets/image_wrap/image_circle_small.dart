import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';

class ImageCircleWrap extends StatelessWidget {
  const ImageCircleWrap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: backgroundLightPrimaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
