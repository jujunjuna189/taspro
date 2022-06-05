import 'package:flutter/material.dart';
import 'package:taspro/screens/dashboard/dashboard_screen.dart';
import 'package:taspro/screens/profile/profile_screen.dart';
import 'package:taspro/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenTab = 0;
  final List<Widget> screen = [
    const DashboardScreen(),
    const ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const DashboardScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: ((){}),
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
                        currentScreen = const DashboardScreen();
                        currenTab = 0;
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
                        currentScreen = const ProfileScreen();
                        currenTab = 1;
                      });
                    }),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_outline,
                          color: currenTab == 1 ? textPrimaryColor : textBlackColor,
                        ),
                        Text("Profile", style: TextStyle(color: currenTab == 1 ? textPrimaryColor : textBlackColor),),
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
                        currentScreen = const DashboardScreen();
                        currenTab = 0;
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
                        currentScreen = const ProfileScreen();
                        currenTab = 1;
                      });
                    }),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_outline,
                          color: currenTab == 1 ? textPrimaryColor : textBlackColor,
                        ),
                        Text("Profile", style: TextStyle(color: currenTab == 1 ? textPrimaryColor : textBlackColor),),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
