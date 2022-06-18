import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/previouse_back_button.dart';
import 'package:taspro/widgets/card/task_card_small.dart';
import 'package:taspro/widgets/text/normal_text.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation){
          return ListView(
            children: [
              Row(
                children: <Widget>[
                  PreviouseBackButton(
                    onTap: ((){
                      Navigator.of(context).pop();
                    }),
                  ),
                  const NormalText(text: "Member"),
                ],
              ),
              ListView(
                padding: EdgeInsets.only(
                    left: Sizes.intense.screenHorizontal(context) * 5,
                    right: Sizes.intense.screenHorizontal(context) * 5,
                    top: Sizes.intense.screenHorizontal(context) * 10,
                    bottom: Sizes.intense.screenHorizontal(context) * 10
                ),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: const <Widget>[
                  TaskCardSmall(),
                  TaskCardSmall(),
                  TaskCardSmall(),
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ((){
          print('Invite');
        }),
        backgroundColor: backgroundBlackColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
