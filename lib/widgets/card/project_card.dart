import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/widgets/text/small_text.dart';

class ProjectCard extends StatefulWidget {
  final String text;
  final Function? onTap;
  const ProjectCard({Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ((){
        widget.onTap != null ? widget.onTap!() : null;
      }),
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundLightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallText(text: widget.text, fontWeight: FontWeight.bold, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
