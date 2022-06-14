import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';

class FieldTitle extends StatefulWidget {
  const FieldTitle({Key? key}) : super(key: key);

  @override
  State<FieldTitle> createState() => _FieldTitleState();
}

class _FieldTitleState extends State<FieldTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 3, color: backgroundBlackColor)),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: Sizes.intense.screenHorizontal(context) * 4.5, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: "Judul",
          hintStyle: TextStyle(fontSize: Sizes.intense.screenHorizontal(context) * 4.5, fontWeight: FontWeight.bold),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
