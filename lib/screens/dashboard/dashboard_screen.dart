import 'package:flutter/material.dart';
import 'package:taspro/model/project_model.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/card/project_card_small.dart';
import 'package:taspro/widgets/card/task_card_small.dart';
import 'package:taspro/widgets/text/medium_text.dart';
import 'package:taspro/widgets/text/normal_text.dart';
import 'package:taspro/widgets/text/small_text.dart';
import 'package:taspro/widgets/text_field/field_search.dart';

class DashboardScreen extends StatefulWidget {
  final List<ProjectModel> listProject;
  const DashboardScreen({Key? key,
    required this.listProject,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ScrollPhysics(),
        padding: EdgeInsets.only(
            left: Sizes.intense.screenHorizontal(context) * 5,
            right: Sizes.intense.screenHorizontal(context) * 5,
            top: Sizes.intense.screenHorizontal(context) * 10,
            bottom: Sizes.intense.screenHorizontal(context) * 10
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      // image: AssetImage(),
                      color: backgroundLightPrimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(width: Sizes.intense.screenHorizontal(context) * 3,),
                  const NormalText(text: "Stevan Bambang", fontWeight: FontWeight.bold,),
                ],
              ),
              Icon(Icons.notifications_none_outlined, size: Sizes.intense.screenHorizontal(context) * 6,),
            ],
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 4,),
          const FieldSearch(),
          SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              MediumText(text: "Tugas Utama"),
            ],
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 3,),
          SizedBox(
            height: Sizes.intense.screenVertical(context) * 15,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: widget.listProject.map((value) {
                return ProjectCardSmall(text: value.title,);
              }).toList(),
            ),
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              MediumText(text: "Tugas"),
              SmallText(text: "Lainnya"),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: <Widget>[
              TaskCardSmall(onChange: ((e){}),),
              TaskCardSmall(onChange: ((e){}),),
              TaskCardSmall(onChange: ((e){}),),
            ],
          ),
        ],
      ),
    );
  }
}
