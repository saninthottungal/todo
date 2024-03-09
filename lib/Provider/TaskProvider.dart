import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/Database/DBFunctions/DBFunctions.dart';

import 'package:todo/Database/DatabaseModel/TaskModel.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  Future<void> add(TaskModel task) async {
    tasks.add(task);
    notifyListeners();
    await DBFunction().addHive(task);
  }

  Future<void> remove(TaskModel task) async {
    tasks.remove(task);
    notifyListeners();
    await DBFunction().removeHive(task);
  }

  Future<void> checkChange(TaskModel task, bool? value) async {
    task.isChecked = value ?? false;
    notifyListeners();
    await DBFunction().checkHive(task, value);
  }

  Future<void> getAllTasks() async {
    final db = await Hive.openBox<TaskModel>("task");
    tasks.clear();
    tasks.addAll(db.values);
    notifyListeners();
  }
}
