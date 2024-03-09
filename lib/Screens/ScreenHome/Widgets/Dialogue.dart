import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Database/DatabaseModel/TaskModel.dart';
import 'package:todo/Provider/TaskProvider.dart';

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
          maxLength: 35,
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
                if (taskController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
                    // behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 1500),
                    backgroundColor: Color.fromARGB(255, 255, 100, 137),
                    content: Text("Empty Task discarded"),
                  ));
                  Navigator.of(ctx).pop();
                } else {
                  Provider.of<TaskProvider>(context, listen: false)
                      .add(TaskModel(
                    task: taskController.text.trim(),
                  ));
                  Navigator.of(ctx).pop();
                  taskController.clear();
                }
              },
              child: const Text("Add"),
            ),
          ],
        )
      ],
    );
  }
}
