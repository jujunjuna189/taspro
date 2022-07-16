import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/text/medium_text.dart';
import 'package:taspro/widgets/text/normal_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
            left: Sizes.intense.screenHorizontal(context) * 5,
            right: Sizes.intense.screenHorizontal(context) * 5,
            top: Sizes.intense.screenHorizontal(context) * 10,
            bottom: Sizes.intense.screenHorizontal(context) * 10
        ),
        physics: const ScrollPhysics(),
        children: <Widget>[
          const MediumText(text: 'Setting'),
          SizedBox(height: Sizes.intense.screenVertical(context) * 3,),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: backgroundLightPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: Sizes.intense.screenVertical(context) * 2,),
                    NormalText(text: "Account"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 15,),
              ],
            ),
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 1,),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: backgroundLightPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications),
                    SizedBox(width: Sizes.intense.screenVertical(context) * 2,),
                    NormalText(text: "Notification"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 15,),
              ],
            ),
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 1,),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: backgroundLightPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(width: Sizes.intense.screenVertical(context) * 2,),
                    NormalText(text: "Privacy Policy"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 15,),
              ],
            ),
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 1,),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: backgroundLightPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.message),
                    SizedBox(width: Sizes.intense.screenVertical(context) * 2,),
                    NormalText(text: "FAQ"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 15,),
              ],
            ),
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 1,),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: backgroundLightPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.language),
                    SizedBox(width: Sizes.intense.screenVertical(context) * 2,),
                    NormalText(text: "Language"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 15,),
              ],
            ),
          ),
          SizedBox(height: Sizes.intense.screenVertical(context) * 1,),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: backgroundLightPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(width: Sizes.intense.screenVertical(context) * 2,),
                    NormalText(text: "About"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 15,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
