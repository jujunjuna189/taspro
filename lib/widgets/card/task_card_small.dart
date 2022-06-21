import 'package:flutter/material.dart';
import 'package:taspro/utils/colors.dart';
import 'package:taspro/utils/sizes.dart';
import 'package:taspro/widgets/text/small_text.dart';

class TaskCardSmall extends StatefulWidget {
  final String? title;
  final int? completed;
  final int? deleted;
  final Function? onChange;
  const TaskCardSmall({Key? key,
    this.title = '',
    this.completed = 0,
    this.deleted,
    this.onChange,
  }) : super(key: key);

  @override
  State<TaskCardSmall> createState() => _TaskCardSmallState();
}

class _TaskCardSmallState extends State<TaskCardSmall> {
  bool _checkValue = false;

  @override
  void initState(){
    _checkValue = widget.completed! == 1 ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Sizes.intense.screenVertical(context) * 1.5),
      child: Container(
        width: Sizes.intense.screenHorizontal(context) * 50,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundLightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: BoxConstraints(
            minHeight: Sizes.intense.screenVertical(context) * 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: _checkValue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onChanged: ((value){
                widget.onChange!(value);
                setState((){
                  _checkValue = value!;
                });
              })
            ),
            Expanded(child: SmallText(text: widget.title!, fontWeight: FontWeight.bold,)),
          ],
        ),
      ),
    );
  }
}
