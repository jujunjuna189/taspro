import 'package:flutter/material.dart';
import 'package:taspro/model/project_model.dart';
import 'package:taspro/model/task_model.dart';
import 'package:taspro/model/workspace_model.dart';
import 'package:taspro/repository/auth_repo.dart';
import 'package:taspro/repository/project_repo.dart';
import 'package:taspro/repository/task_repo.dart';
import 'package:taspro/repository/workspace_repo.dart';
import 'package:taspro/screens/dashboard/dashboard_screen.dart';
import 'package:taspro/screens/profile/profile_screen.dart';
import 'package:taspro/screens/setting/setting_screen.dart';
import 'package:taspro/screens/workspace/workspace_screen.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/widgets/modal/modal_add_floating.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const DashboardScreen(listProject: [], listTask: [],);

  //Dashboard data set
  List<WorkspaceModel> _workspaceDashboard = [];
  List<ProjectModel> _listProjectDashboard = [];
  List<TaskModel> _listTaskDashboard = [];
  //============================================

  //Dashboard data function
  void setSessionWorkspace() async {
    Map<String, dynamic> workspaceData = {
      'id': _workspaceDashboard[0].id,
      'title': _workspaceDashboard[0].title,
    };

    await AuthRepo.instance.setSession("workspace", workspaceData);
  }

  void setFirstData() async {
    await AuthRepo.instance.getSession("workspace").then((value){
      if(value == null){
        setSessionWorkspace();
      }
    });
  }

  Future<void> getDataDashboard() async {
    try{
      final user = await AuthRepo.instance.getSession("user");
      _workspaceDashboard = await WorkspaceRepo.instance.getData({'user_id': user['id']});
      _listProjectDashboard = await ProjectRepo.instance.getData({'workspace_id': _workspaceDashboard[(_workspaceDashboard.length - 1)].id});
      _listTaskDashboard = await TaskRepo.instance.getDataByWorkspace({'user_id': user['id'], 'workspace_id': _workspaceDashboard[(_workspaceDashboard.length - 1)].id});
      setFirstData();
      setState((){});
    }catch(e){
      print("$e Dashboard getdata");
    }
  }
  //============================================

  //Workspace data set
  Map<String, dynamic> _workspaceWorkspace = {};
  List<ProjectModel> _listProjectWorkspace = [];
  //============================================

  Future<void> getDataWorkspace() async {
    try{
      final user = await AuthRepo.instance.getSession("user");
      _workspaceWorkspace = await AuthRepo.instance.getSession("workspace");
      _listProjectWorkspace = await ProjectRepo.instance.getData({'user_id': user['id'], 'workspace_id': _workspaceWorkspace['id']});
      setState((){});
    }catch(e){
      print("$e Workspace getdata");
    }
  }

  //========================================================

  void tabNavigator(tab){
    currenTab = tab;
    if(tab == 0){
      currentScreen = DashboardScreen(listProject: _listProjectDashboard, listTask: _listTaskDashboard,);
    }
    if(tab == 1){
      currentScreen = WorkspaceScreen(workspace: _workspaceWorkspace, listProject: _listProjectWorkspace,);
    }
    if(tab == 2){
      currentScreen = const SettingScreen();
    }
    if(tab == 3){
      currentScreen = const ProfileScreen();
    }
  }

  void combine() async {
    await getDataDashboard();
    await getDataWorkspace();
    tabNavigator(currenTab);
  }

  @override
  void initState(){
    combine();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (() async {
        combine();
      }),
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: ((){
            ModalAddFloating.intense.modalShow(context);
          }),
          backgroundColor: backgroundBlackColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
          notchMargin: 5,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: ((){
                        setState((){
                          tabNavigator(0);
                        });
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.dashboard,
                            color: currenTab == 0 ? textPrimaryColor : textBlackColor,
                          ),
                          Text("Home", style: TextStyle(color: currenTab == 0 ? textPrimaryColor : textBlackColor),),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: ((){
                        setState((){
                          tabNavigator(1);
                        });
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.folder_open,
                            color: currenTab == 1 ? textPrimaryColor : textBlackColor,
                          ),
                          Text("Workspace", style: TextStyle(color: currenTab == 1 ? textPrimaryColor : textBlackColor),),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: ((){
                        setState((){
                          tabNavigator(2);
                        });
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: currenTab == 2 ? textPrimaryColor : textBlackColor,
                          ),
                          Text("Setting", style: TextStyle(color: currenTab == 2 ? textPrimaryColor : textBlackColor),),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: ((){
                        setState((){
                          tabNavigator(3);
                        });
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person_outline,
                            color: currenTab == 3 ? textPrimaryColor : textBlackColor,
                          ),
                          Text("Profile", style: TextStyle(color: currenTab == 3 ? textPrimaryColor : textBlackColor),),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}