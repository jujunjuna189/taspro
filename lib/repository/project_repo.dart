import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taspro/model/project_model.dart';
import 'package:taspro/utils/api_const.dart';

class ProjectRepo {
  ProjectRepo._privateConstructor();
  static final ProjectRepo instance = ProjectRepo._privateConstructor();

  final _uriGet = ApiConst.getProject;

  Future getData(Map<String, dynamic> data) async {
    try{
      String userId = data.containsKey('user_id') ? data['user_id'].toString() : '';
      String workspaceId = data.containsKey('workspace_id') ? data['workspace_id'].toString() : '';
      final response = await http.get(Uri.parse('$_uriGet?user_id=$userId&workspace_id=$workspaceId'));

      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        Iterable iterable = jsonResponse['data'];
        List<ProjectModel> listProject = iterable.isNotEmpty ? iterable.map((e) => ProjectModel.fromJson(e)).toList() : [];
        return listProject;
      }
    }catch(e){
      print("$e Project repo");
    }

    return [];
  }
}