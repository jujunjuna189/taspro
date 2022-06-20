import 'package:flutter/material.dart';
import 'package:taspro/repository/auth_repo.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/previouse_back_button.dart';
import 'package:taspro/widgets/button/submit_button.dart';
import 'package:taspro/widgets/text/big_text.dart';
import 'package:taspro/widgets/text/normal_text.dart';
import 'package:taspro/widgets/text/small_text.dart';
import 'package:taspro/widgets/text_field/field_email.dart';
import 'package:taspro/widgets/text_field/field_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    Map<String, dynamic> dataBatch = {
      'email': _emailController.text.trim().toString(),
      'password': _passwordController.text.trim().toString(),
    };

    await AuthRepo.instance.authLogin(dataBatch).then((value) {
      if(value){
        Navigator.of(context).pushNamed('/home');
      }else{
        print('Gagal login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation){
          return ListView(
            physics: const ScrollPhysics(),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  PreviouseBackButton(
                    onTap: ((){
                      Navigator.of(context).pop();
                    }),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: Sizes.intense.screenVertical(context) * 6,),
                  const BigText(text: "TASPRO",),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 1,),
                  const NormalText(text: "Task Progress", fontWeight: FontWeight.bold,),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 15,),
                  const NormalText(text: "MASUK", fontWeight: FontWeight.bold,),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.intense.screenHorizontal(context) * 10),
                    child: FieldEmail(controller: _emailController,),
                  ),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 2,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.intense.screenHorizontal(context) * 10),
                    child: FieldPassword(controller: _passwordController,),
                  ),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.intense.screenHorizontal(context) * 12),
                    child: SubmitButton(
                      onPressed: ((){
                        _login();
                      }),
                      text: "MASUK",
                    ),
                  ),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 5,),
                  const SmallText(text: "Versi 1.26.0"),
                  SizedBox(height: Sizes.intense.screenVertical(context) * 10,),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
