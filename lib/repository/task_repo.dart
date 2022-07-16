import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taspro/model/task_model.dart';
import 'package:taspro/utils/api_const.dart';

class TaskRepo {
  TaskRepo._privateConstructor();
  static final TaskRepo instance = TaskRepo._privateConstructor();

  final _uriGet = ApiConst.getTask;
  final _uriGetByWorkspace = ApiConst.getTaskByWorkspace;
  final _uriCreate = ApiConst.createTask;
  final _uriUpdate = ApiConst.updateTask;

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

  Future getDataByWorkspace(Map<String, dynamic> data) async {
    try{
      String userId = data.containsKey('user_id') ? data['user_id'].toString() : '';
      String projectId = data.containsKey('workspace_id') ? data['workspace_id'].toString() : '';
      final response = await http.get(Uri.parse('$_uriGetByWorkspace?user_id=$userId&workspace_id=$projectId'));

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

  Future createData(Map<String, dynamic> data) async {
    try{
      Map<String, dynamic> dataBatch = {
        'project_id': data['project_id'],
        'title': data['title'],
        'completed': data['completed'],
        'deleted': data['deleted'],
      };

      final response = await http.post(Uri.parse(_uriCreate), body: dataBatch);
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data'];
      }else{
        print("Failed");
      }
    }catch(e){
      print("$e Project repo");
    }

    return null;
  }

  Future updateData(Map<String, dynamic> data) async {
    try{
      Map<String, dynamic> dataBatch = {
        'id': data['id'],
        'completed': data['completed'],
      };

      final response = await http.post(Uri.parse(_uriUpdate), body: dataBatch);
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['data'];
      }else{
        print("Failed");
      }
    }catch(e){
      print("$e Project repo");
    }

    return null;
  }
}