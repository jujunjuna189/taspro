import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taspro/model/task_model.dart';
import 'package:taspro/repository/task_repo.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/custome_icon_button.dart';
import 'package:taspro/widgets/button/previouse_back_button.dart';
import 'package:taspro/widgets/card/task_card_small.dart';
import 'package:taspro/widgets/image_wrap/image_circle_small.dart';
import 'package:taspro/widgets/modal/modal_add_task.dart';
import 'package:taspro/widgets/sleek/sleek_progress.dart';
import 'package:taspro/widgets/text/medium_text.dart';
import 'package:taspro/widgets/text/normal_text.dart';
import 'package:taspro/widgets/text/small_text.dart';

class ProjectScreen extends StatefulWidget {
  final String data;
  const ProjectScreen({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  int _projectId = 0;
  List<TaskModel> _listTask = [];
  double _valProgress = 0;

  void _navigationFormTask() {
    ModalAddTask.intense.modalShow(context, data: jsonEncode({'project_id': _projectId}), calback: ((value){
      Iterable iterable = value;
      List<TaskModel> listProject = iterable.isNotEmpty ? iterable.map((e) => TaskModel.fromJson(e)).toList() : [];
      _listTask.addAll(listProject);
      countProgress();
      setState((){});
    }));
  }

  void countProgress() {
    double listTaskCompleted = 0;

    for(var i = 0; i < _listTask.length; i++){
      if(_listTask[i].completed == "1"){
        listTaskCompleted =  listTaskCompleted + 1;
      }
    }

    _valProgress = _listTask.isNotEmpty ? (listTaskCompleted / double.parse(_listTask.length.toString())) * 100 : 0;
  }

  void setTaskCompleted(int taskId, bool completed) {
    int setCompl = completed ? 1 : 0;
    int index = _listTask.indexWhere((value) => value.id == taskId);
    _listTask[index] = TaskModel(id: _listTask[index].id, projectId: _listTask[index].projectId, title: _listTask[index].title, completed: setCompl.toString(), deleted: "0");
    countProgress();
    setState((){});
  }

  void getTask() async {
    _listTask = await TaskRepo.instance.getData({'project_id': _projectId}) ?? [];
    countProgress();
    setState((){});
  }

  void setFirstData() {
    Map<String, dynamic> dataDynamic = jsonDecode(widget.data) as Map<String, dynamic>;
    _projectId = dataDynamic['project_id'];
    getTask();
  }

  @override
  void initState() {
    setFirstData();
    super.initState();
  }

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
                SleekProgress(value: _valProgress,),
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
                    CustomeIconButton(icon: Icons.add, onTap: ((){
                      _navigationFormTask();
                    }),),
                  ],
                ),
                SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
                ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: _listTask.map((value) {
                    return TaskCardSmall(
                      id: value.id,
                      title: value.title,
                      completed: int.parse(value.completed!),
                      deleted: int.parse(value.deleted!),
                      onChange: ((completed){
                        setTaskCompleted(value.id, completed);
                      }),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
