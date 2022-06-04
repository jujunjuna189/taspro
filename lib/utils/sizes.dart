import 'package:flutter/material.dart';

class Sizes{
  Sizes._privateController();
  static final intense = Sizes._privateController();

  double screenHorizontal(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 100;
    return size;
  }

  double screenVertical(BuildContext context) {
    double size = MediaQuery.of(context).size.height / 100;
    return size;
  }


}