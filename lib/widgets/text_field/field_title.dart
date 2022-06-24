import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';

class FieldTitle extends StatefulWidget {
  final TextEditingController? controller;
  const FieldTitle({Key? key,
    this.controller,
  }) : super(key: key);

  @override
  State<FieldTitle> createState() => _FieldTitleState();
}

class _FieldTitleState extends State<FieldTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundSuperLightPrimaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      constraints: BoxConstraints(
        minHeight: Sizes.intense.screenVertical(context) * 10
      ),
      child: TextField(
        controller: widget.controller,
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
