import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/TaskProvider.dart';
import 'package:todo/Screens/ScreenHome/Widgets/EmptyDialogue.dart';
import 'package:todo/Screens/ScreenHome/Widgets/FAB.dart';
import 'package:todo/Screens/ScreenHome/Widgets/TasksListview.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.settings,
              color: Colors.white70,
            ),
          )
        ],
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "The To-Do",
            style: TextStyle(
              fontSize: 35,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 5,
          top: 5,
          right: 20,
        ),
        child: Provider.of<TaskProvider>(context).tasks.isEmpty
            ? const EmptyDialogue()
            : const TasksListview(),
      ),
      floatingActionButton: const NewTaskFAB(),
    );
  }
}
