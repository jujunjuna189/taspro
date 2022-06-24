import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taspro/screens/task/form_task.dart';

class ModalAddTask{
  ModalAddTask._privateController();
  static final intense = ModalAddTask._privateController();

  void modalShow(BuildContext context, String data){
    showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        context: context,
        builder: (context) {
          // for detect position object
          return StatefulBuilder(builder: (context, setState){
            return FormTask(data: data);
          });
        }
    );
  }
}