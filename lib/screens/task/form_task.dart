import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taspro/repository/task_repo.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/previouse_back_button.dart';
import 'package:taspro/widgets/text/normal_text.dart';
import 'package:taspro/widgets/text_field/field_title.dart';

class FormTask extends StatefulWidget {
  final String data;
  final Function? calback;
  const FormTask({Key? key,
    required this.data,
    this.calback,
  }) : super(key: key);

  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {
  final TextEditingController _titleController = TextEditingController();
  final List<Map<String, dynamic>> _draft = [];
  String _projectId = "";

  void onSaved() async {
    Map<String, dynamic> dataBatch = {
      'project_id': _projectId,
      'title': _titleController.text.toString(),
      'completed': "0",
      'deleted': "0"
    };

    final response = await TaskRepo.instance.createData(dataBatch);

    if(response != null){
      _draft.add(response);
      widget.calback!(_draft);
    }else{
      print("Gagal");
    }
  }

  @override
  void initState() {
    Map<String, dynamic> dataDynamic = jsonDecode(widget.data) as Map<String, dynamic>;
    _projectId = dataDynamic['project_id'].toString();
    print(_projectId);
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
                  const NormalText(text: "Buat Tugas Baru"),
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
        }
      ),
      floatingActionButton: Visibility(
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
}
