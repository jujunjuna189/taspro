import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/text/small_text.dart';

class ModalAddFloating{
  ModalAddFloating._privateController();
  static final intense = ModalAddFloating._privateController();

  void modalShow(BuildContext context){
    showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        context: context,
        builder: (context) {
          // for detect position object
          return StatefulBuilder(builder: (context, setState){
            return Stack(
              children: [
                Positioned(
                  left: Sizes.intense.screenHorizontal(context) * 20,
                  right: Sizes.intense.screenHorizontal(context) * 20,
                  bottom: Sizes.intense.screenVertical(context) * 20,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20.0,
                              offset: Offset(0.0, 10.0)
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20, vertical: MediaQuery.of(context).size.height / 30),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: backgroundLightPrimaryColor,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Icon(Icons.layers),
                                ),
                                SizedBox(width: Sizes.intense.screenHorizontal(context) * 3,),
                                const SmallText(text: "Tambah Projek", fontWeight: FontWeight.bold,),
                              ],
                            ),
                            SizedBox(height: Sizes.intense.screenVertical(context) * 3,),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: backgroundLightSuccessColor,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Icon(Icons.task),
                                ),
                                SizedBox(width: Sizes.intense.screenHorizontal(context) * 3,),
                                const SmallText(text: "Tambah Tugas", fontWeight: FontWeight.bold,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          });
        }
    );
  }
}