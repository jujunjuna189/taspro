import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        style: TextStyle(fontSize: Sizes.intense.screenHorizontal(context) * 4.5, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(fontSize: Sizes.intense.screenHorizontal(context) * 4.5, fontWeight: FontWeight.bold),
          prefixIcon: Icon(Icons.lock_outline, size: Sizes.intense.screenHorizontal(context) * 6.5, color: textBlackColor,),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
