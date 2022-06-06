import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';

class ProjectCard extends StatefulWidget {
  final Function? onTap;
  const ProjectCard({Key? key,
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
        decoration: BoxDecoration(
          color: backgroundLightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
