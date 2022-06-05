import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';

class FieldSearch extends StatelessWidget {
  const FieldSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 15, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: backgroundSecondaryColor,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: Sizes.intense.screenHorizontal(context) * 4.5),
        decoration: InputDecoration(
          hintText: "Cari Project...",
          hintStyle: TextStyle(fontSize: Sizes.intense.screenHorizontal(context) * 3.5, fontWeight: FontWeight.bold),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(Icons.search, size: Sizes.intense.screenHorizontal(context) * 5.5, color: textBlackColor,),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
