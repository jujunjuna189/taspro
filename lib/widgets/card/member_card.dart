import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/text/small_text.dart';

class MemberCard extends StatelessWidget {
  final String? name;
  final String? role;
  const MemberCard({Key? key,
    this.name = '',
    this.role = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Sizes.intense.screenVertical(context) * 1.5),
      child: Container(
        height: Sizes.intense.screenVertical(context) * 10,
        width: Sizes.intense.screenHorizontal(context) * 50,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundLightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallText(text: name!, fontWeight: FontWeight.bold,),
            SmallText(text: role!),
          ],
        ),
      ),
    );
  }
}
