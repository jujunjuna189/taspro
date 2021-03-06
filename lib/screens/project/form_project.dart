import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taspro/repository/project_repo.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/previouse_back_button.dart';
import 'package:taspro/widgets/text/normal_text.dart';
import 'package:taspro/widgets/text_field/field_title.dart';

class FormProject extends StatefulWidget {
  final String data;
  const FormProject({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<FormProject> createState() => _FormProjectState();
}

class _FormProjectState extends State<FormProject> {
  final TextEditingController _titleController = TextEditingController();
  final List<Map<String, dynamic>> _draft = [];
  String _workspaceId = "";

  void onSaved() async {
    Map<String, dynamic> dataBatch = {
      'workspace_id': _workspaceId,
      'title': _titleController.text.toString(),
      'description': "",
      'deadline': "",
      'visibility': "Private",
    };

    final response = await ProjectRepo.instance.createData(dataBatch);

    if(response != null){
      _draft.add(response);
    }else{
      print("Gagal");
    }
  }

  @override
  void initState() {
    Map<String, dynamic> dataDynamic = jsonDecode(widget.data) as Map<String, dynamic>;
    _workspaceId = dataDynamic['workspace_id'].toString();
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
                      Navigator.of(context).pop(jsonEncode(_draft));
                    }),
                  ),
                  const NormalText(text: "Buat Projek Baru"),
                ],
              ),
              SizedBox(height: Sizes.intense.screenVertical(context) * 3,),
              Padding(
                padding: EdgeInsets.only(
                    left: Sizes.intense.screenHorizontal(context) * 5,
                    right: Sizes.intense.screenHorizontal(context) * 5,
                ),
                child: Column(
                  children: [
                    FieldTitle(controller: _titleController,),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Visibility(
        visible: !checkVisibleWithScreen(),
        child: FloatingActionButton.extended(
          onPressed: ((){
            onSaved();
          }),
          backgroundColor: backgroundBlackColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          icon: const Icon(Icons.save),
          label: const Text("Simpan"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  bool checkVisibleWithScreen(){
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return keyboardIsOpen;
  }
}
