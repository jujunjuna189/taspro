import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taspro/model/member_model.dart';
import 'package:taspro/repository/member_repo.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/previouse_back_button.dart';
import 'package:taspro/widgets/card/member_card.dart';
import 'package:taspro/widgets/text/normal_text.dart';

class MemberScreen extends StatefulWidget {
  final String data;
  const MemberScreen({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  int _workspaceId = 0;
  List<MemberModel> _listMember = [];

  void getMember() async {
    _listMember = await MemberRepo.instance.getData({'workspace_id': _workspaceId});
    setState((){});
  }

  void setFirstData() {
    Map<String, dynamic> dataDynamic = jsonDecode(widget.data) as Map<String, dynamic>;
    _workspaceId = dataDynamic['workspace_id'];
    getMember();
  }

  @override
  void initState() {
    setFirstData();
    super.initState();
  }

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
                children: _listMember.map((value) {
                  return MemberCard(name: value.name, role: value.role,);
                }).toList(),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ((){
          print(_workspaceId);
        }),
        backgroundColor: backgroundBlackColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
