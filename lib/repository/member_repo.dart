import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taspro/model/member_model.dart';
import 'package:taspro/utils/api_const.dart';

class MemberRepo {
  MemberRepo._privateConstructor();
  static final MemberRepo instance = MemberRepo._privateConstructor();

  final _uriGet = ApiConst.getMember;

  Future getData(Map<String, dynamic> data) async {
    try{
      String userId = data.containsKey('user_id') ? data['user_id'].toString() : '';
      String workspaceId = data.containsKey('workspace_id') ? data['workspace_id'].toString() : '';
      final response = await http.get(Uri.parse('$_uriGet?user_id=$userId&workspace_id=$workspaceId'));

      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        Iterable iterable = jsonResponse['data'];
        List<MemberModel> listMember = iterable.map((e) => MemberModel.fromJson(e)).toList();
        return listMember;
      }
    }catch(e){
      print(e.toString());
    }
  }
}