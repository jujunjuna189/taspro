import 'package:flutter/material.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/previouse_back_button.dart';
import 'package:taspro/widgets/sleek/sleek_progress.dart';
import 'package:taspro/widgets/text/medium_text.dart';
import 'package:taspro/widgets/text/normal_text.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PreviouseBackButton(
                onTap: ((){
                  Navigator.of(context).pop();
                }),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Sizes.intense.screenHorizontal(context) * 5,
                right: Sizes.intense.screenHorizontal(context) * 5,
                bottom: Sizes.intense.screenHorizontal(context) * 10
            ),
            child: Column(
              children: [
                const SleekProgress(),
                SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
                const MediumText(text: "Judul Tugas Utama"),
                SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
                Row(
                  children: [
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
