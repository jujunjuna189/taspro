import 'package:flutter/material.dart';

class FieldEmail extends StatelessWidget {
  const FieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text("Email"),
      ),
    );
  }
}
