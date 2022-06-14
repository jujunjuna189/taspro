import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/custome_icon_button.dart';
import 'package:taspro/widgets/button/previouse_back_button.dart';
import 'package:taspro/widgets/card/task_card_small.dart';
import 'package:taspro/widgets/image_wrap/image_circle_small.dart';
import 'package:taspro/widgets/sleek/sleek_progress.dart';
import 'package:taspro/widgets/text/medium_text.dart';
import 'package:taspro/widgets/text/normal_text.dart';
import 'package:taspro/widgets/text/small_text.dart';

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
            children: <Widget>[
              PreviouseBackButton(
                onTap: ((){
                  Navigator.of(context).pop();
                }),
              ),
              const NormalText(text: "Detail Projek"),
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
                SizedBox(height: Sizes.intense.screenVertical(context) * 3,),
                Container(
                  decoration: BoxDecoration(
                    color: backgroundDangerColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: const SmallText(text: "12 Hari Lagi",),
                ),
                SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Stack(
                        children: const [
                          ImageCircleWrap(),
                          Positioned(
                              left: 20,
                              child: ImageCircleWrap()
                          ),
                          Positioned(
                              left: 40,
                              child: ImageCircleWrap()
                          ),
                          Positioned(
                              left: 60,
                              child: ImageCircleWrap()
                          ),
                        ],
                      ),
                    ),
                    const CustomeIconButton(icon: Icons.add),
                  ],
                ),
                SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
                ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: const <Widget>[
                    TaskCardSmall(),
                    TaskCardSmall(),
                    TaskCardSmall(),
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
