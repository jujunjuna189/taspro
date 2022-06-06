import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';

class CustomeIconButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Function? onTap;
  const CustomeIconButton({Key? key,
    this.icon,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ((){
        onTap != null ? onTap!() : null;
      }),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundLightPrimaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: text != null ? Row(
          children: [
            Icon(icon ?? Icons.add),
            SizedBox(width: Sizes.intense.screenHorizontal(context) * 1,),
            Text(text!),
          ],
        ) : Icon(icon ?? Icons.add),
      ),
    );
  }
}
