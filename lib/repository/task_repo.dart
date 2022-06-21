import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taspro/model/task_model.dart';
import 'package:taspro/utils/api_const.dart';

class TaskRepo {
  TaskRepo._privateConstructor();
  static final TaskRepo instance = TaskRepo._privateConstructor();

  final _uriGet = ApiConst.getTask;

  Future getData(Map<String, dynamic> data) async {
    try{
      String projectId = data.containsKey('project_id') ? data['project_id'].toString() : '';
      final response = await http.get(Uri.parse('$_uriGet?project_id=$projectId'));

      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        Iterable iterable = jsonResponse['data'];
        List<TaskModel> listTask = iterable.isNotEmpty ? iterable.map((e) => TaskModel.fromJson(e)).toList() : [];
        return listTask;
      }
    }catch(e){
      print("$e Task repo");
    }
  }
}