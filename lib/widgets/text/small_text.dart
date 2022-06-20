import 'package:flutter/material.dart';
import 'package:taspro/utils/sizes.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign textAlign;
  const SmallText({Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: Sizes.intense.screenHorizontal(context) * 4,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
