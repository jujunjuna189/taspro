import 'package:flutter/material.dart';
import 'package:taspro/utils/sizes.dart';

class PreviouseBackButton extends StatelessWidget {
  final Function()? onTap;
  const PreviouseBackButton({Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ((){
        onTap!();
      }),
      child: Padding(
        padding: EdgeInsets.all(Sizes.intense.screenHorizontal(context) * 5),
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
