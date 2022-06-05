import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/text/normal_text.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? color;
  final Function()? onPressed;
  const SubmitButton({Key? key,
    required this.text,
    this.textColor,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ((){
        onPressed!();
      }),
      style: ElevatedButton.styleFrom(
        primary: color ?? backgroundPrimaryColor,
        onPrimary: textColor ?? Colors.white,
        minimumSize: const Size.fromHeight(50),
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: Sizes.intense.screenVertical(context) * 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
      ),
      child: NormalText(text: text, fontWeight: FontWeight.bold,),
    );
  }
}
