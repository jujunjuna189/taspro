import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';

class FieldEmail extends StatelessWidget {
  final TextEditingController? controller;
  const FieldEmail({Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: Sizes.intense.screenHorizontal(context) * 4.5, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(fontSize: Sizes.intense.screenHorizontal(context) * 4.5, fontWeight: FontWeight.bold),
          prefixIcon: Icon(Icons.email_outlined, size: Sizes.intense.screenHorizontal(context) * 6.5, color: textBlackColor,),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
