import 'package:flutter/material.dart';
import 'package:todo/Screens/ScreenHome/Widgets/Dialogue.dart';

class NewTaskFAB extends StatelessWidget {
  const NewTaskFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: const Color.fromARGB(255, 255, 100, 137),
      icon: const Icon(
        Icons.add,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      label: const Text("New Task",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          )),
      onPressed: () async {
        await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (ctx) {
              return CustomDialogue(ctx: ctx);
            });
      },
    );
  }
}
