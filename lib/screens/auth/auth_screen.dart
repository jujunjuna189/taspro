import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/submit_button.dart';
import 'package:taspro/widgets/text/big_text.dart';
import 'package:taspro/widgets/text/normal_text.dart';
import 'package:taspro/widgets/text/small_text.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation){
          return ListView(
            physics: const ScrollPhysics(),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: Sizes.intense.screenVertical(context) * 15,),
                  const BigText(text: "TASPRO",),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 1,),
                  const NormalText(text: "Task Progress", fontWeight: FontWeight.bold,),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 30,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.intense.screenHorizontal(context) * 20),
                    child: SubmitButton(
                      onPressed: ((){
                        Navigator.of(context).pushNamed("/login");
                      }),
                      text: "MASUK",
                      textColor: textPrimaryColor,
                      color: backgroundLightPrimaryColor,
                    ),
                  ),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 12,),
                  GestureDetector(
                    onTap: ((){
                      Navigator.of(context).pushNamed("/register");
                    }),
                    child: const SmallText(text: "DAFTAR", fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 3,),
                  const SmallText(text: "Versi 1.26.0"),
                ],
              ),
            ]
          );
        },
      ),
    );
  }
}
