import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/TaskProvider.dart';

class CustomDialogue extends StatelessWidget {
  CustomDialogue({super.key, required this.ctx});

  final taskController = TextEditingController();
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        const SizedBox(height: 25),
        TextField(
          controller: taskController,
          maxLength: 25,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            // hintMaxLines: 10,
          ),
        ),
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskProvider>(context, listen: false)
                    .add(taskController.text.trim());
                Navigator.of(ctx).pop();
                taskController.clear();

                Provider.of<TaskProvider>(context, listen: false)
                    .removeEmptyTasks();
              },
              child: const Text("Add"),
            ),
          ],
        )
      ],
    );
  }
}
