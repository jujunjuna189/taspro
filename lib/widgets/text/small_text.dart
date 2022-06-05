import 'package:flutter/material.dart';
import 'package:taspro/utils/sizes.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  const SmallText({Key? key,
    required this.text,
    this.size,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Sizes.intense.screenHorizontal(context) * 4,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
