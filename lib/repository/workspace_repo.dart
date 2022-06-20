import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taspro/model/workspace_model.dart';
import 'package:taspro/utils/api_const.dart';

class WorkspaceRepo {
  WorkspaceRepo._privateConstructor();
  static final WorkspaceRepo instance = WorkspaceRepo._privateConstructor();

  final _uriGet = ApiConst.getWorkspace;

  Future getData(Map<String, dynamic> data) async {
    try{
      String userId = data.containsKey('user_id') ? data['user_id'].toString() : '';
      String workspaceId = data.containsKey('workspace_id') ? data['workspace_id'].toString() : '';
      final response = await http.get(Uri.parse('$_uriGet?user_id=$userId&workspace_id=$workspaceId'));

      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        Iterable iterable = jsonResponse['data'];
        List<WorkspaceModel> listWorkspace = iterable.map((e) => WorkspaceModel.fromJson(e)).toList();
        return listWorkspace;
      }
    }catch(e){
      print(e.toString());
    }
  }
}