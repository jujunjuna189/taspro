import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/button/previouse_back_button.dart';
import 'package:taspro/widgets/text/normal_text.dart';
import 'package:taspro/widgets/text_field/field_title.dart';

class FormProject extends StatefulWidget {
  const FormProject({Key? key}) : super(key: key);

  @override
  State<FormProject> createState() => _FormProjectState();
}

class _FormProjectState extends State<FormProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orienation){
          return ListView(
            children: [
              Row(
                children: <Widget>[
                  PreviouseBackButton(
                    onTap: ((){
                      Navigator.of(context).pop();
                    }),
                  ),
                  const NormalText(text: "Buat Projek Baru"),
                ],
              ),
              SizedBox(height: Sizes.intense.screenVertical(context) * 3,),
              Padding(
                padding: EdgeInsets.only(
                    left: Sizes.intense.screenHorizontal(context) * 5,
                    right: Sizes.intense.screenHorizontal(context) * 5,
                ),
                child: Column(
                  children: const [
                    FieldTitle(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Visibility(
        visible: !checkVisibleWithScreen(),
        child: FloatingActionButton.extended(
          onPressed: ((){
            print('Invite');
          }),
          backgroundColor: backgroundBlackColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          icon: const Icon(Icons.save),
          label: const Text("Simpan"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  bool checkVisibleWithScreen(){
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return keyboardIsOpen;
  }
}
