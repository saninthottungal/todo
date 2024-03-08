import 'package:flutter/material.dart';

class EmptyDialogue extends StatelessWidget {
  const EmptyDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Hi there.\nTry adding a Task !",
      style: TextStyle(
          color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15),
    ));
  }
}
