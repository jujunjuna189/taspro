import 'package:flutter/material.dart';
import 'package:taspro/utils/sizes.dart';

class NormalText extends StatelessWidget {
  final String text;
  final double? size;
  const NormalText({Key? key,
    required this.text,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Sizes.intense.screenHorizontal(context) * 3.5,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
