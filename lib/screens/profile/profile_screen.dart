import 'package:flutter/material.dart';
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
              const NormalText(text: "Stevan Bambang", fontWeight: FontWeight.bold,),
              const SmallText(text: "stevan@gmail.com"),
              SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: Sizes.intense.screenHorizontal(context) * 3, horizontal: Sizes.intense.screenHorizontal(context) * 10),
                    decoration: BoxDecoration(
                      color: backgroundLightPrimaryColor,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const NormalText(text: "Keluar", color: textPrimaryColor),
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
