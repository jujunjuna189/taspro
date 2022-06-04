import 'package:flutter/material.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/big_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation){
          return ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(Icons.arrow_back_ios),
                ],
              ),
              SizedBox(height: Sizes.intense.screenVertical(context) * 2,),
              const BigText(text: "Login",),
            ],
          );
        },
      ),
    );
  }
}
