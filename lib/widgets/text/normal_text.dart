import 'package:flutter/material.dart';
import 'package:taspro/utils/sizes.dart';

class NormalText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  const NormalText({Key? key,
    required this.text,
    this.size,
    this.color,
    this.fontWeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: Sizes.intense.screenHorizontal(context) * 5,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
