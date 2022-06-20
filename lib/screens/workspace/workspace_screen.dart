import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taspro/model/project_model.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/custome_icon_button.dart';
import 'package:taspro/widgets/card/project_card.dart';
import 'package:taspro/widgets/text/medium_text.dart';
import 'package:taspro/widgets/text_field/field_search.dart';

class WorkspaceScreen extends StatefulWidget {
  final Map<String, dynamic> workspace;
  final List<ProjectModel> listProject;
  const WorkspaceScreen({Key? key,
    required this.workspace,
    required this.listProject,
  }) : super(key: key);

  @override
  State<WorkspaceScreen> createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
            left: Sizes.intense.screenHorizontal(context) * 5,
            right: Sizes.intense.screenHorizontal(context) * 5,
            top: Sizes.intense.screenHorizontal(context) * 10,
            bottom: Sizes.intense.screenHorizontal(context) * 10
        ),
        physics: const ScrollPhysics(),
        children: <Widget>[
          MediumText(text: widget.workspace['title'] ?? 'Workspace'),
          SizedBox(height: Sizes.intense.screenVertical(context) * 3,),
          const FieldSearch(),
          SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomeIconButton(onTap: ((){
                Navigator.of(context).pushNamed("/form_project");
              }),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomeIconButton(icon: Icons.group_outlined, text: "Member", onTap: ((){
                    Navigator.of(context).pushNamed("/member", arguments: jsonEncode({"workspace_id": widget.workspace['id']}));
                  }),),
                  SizedBox(width: Sizes.intense.screenHorizontal(context) * 3,),
                  const CustomeIconButton(icon: Icons.keyboard_control_rounded,),
                ],
              ),
            ],
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
          const MediumText(text: "Tugas Utama"),
          GridView.count(
            physics: const ScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: (1 / .7),
            shrinkWrap: true,
            children: widget.listProject.map((value) {
              return ProjectCard(
                onTap: ((){
                  Navigator.of(context).pushNamed("/project", arguments: jsonEncode({'project_id': value.id}));
                }),
                text: value.title,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
