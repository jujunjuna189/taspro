import 'package:flutter/material.dart';
import 'package:taspro/repository/auth_repo.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/text/medium_text.dart';
import 'package:taspro/widgets/text/normal_text.dart';
import 'package:taspro/widgets/text/small_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> _user = {};

  void _logout() async {
    await AuthRepo.instance.authLogout().then((value) {
      Navigator.of(context).pushNamed("/auth");
    });
  }

  void getFirstData() async {
    _user = await AuthRepo.instance.getSession("user");
    setState((){});
  }

  @override
  void initState() {
    getFirstData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ScrollPhysics(),
        padding: EdgeInsets.only(
            left: Sizes.intense.screenHorizontal(context) * 5,
            right: Sizes.intense.screenHorizontal(context) * 5,
            top: Sizes.intense.screenHorizontal(context) * 10,
            bottom: Sizes.intense.screenHorizontal(context) * 10
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 130,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.topRight,
                          colors: [
                            backgroundLightPrimaryColor,
                            backgroundPrimaryColor,
                            backgroundPrimaryColor,
                          ]
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundLightPrimaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            MediumText(text: _user['name'].toString().isNotEmpty ? _user['name'].toString().substring(0, 2) : '',),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.photo_camera),
                  ),
                ],
              ),
              SizedBox(height: Sizes.intense.screenVertical(context) * 3,),
              NormalText(text: _user['name'] ?? '', fontWeight: FontWeight.bold,),
              SmallText(text: _user['email'] ?? ''),
              SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ((){
                      _logout();
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: Sizes.intense.screenHorizontal(context) * 3, horizontal: Sizes.intense.screenHorizontal(context) * 10),
                      decoration: BoxDecoration(
                        color: backgroundLightPrimaryColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: const NormalText(text: "Keluar", color: textPrimaryColor),
                    ),
                  ),
                  SizedBox(width: Sizes.intense.screenHorizontal(context) * 10,),
                  const Icon(Icons.edit, color: textSecondaryColor,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
