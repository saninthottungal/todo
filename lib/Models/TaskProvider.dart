import 'package:flutter/material.dart';
import 'package:todo/Models/TaskModel.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  void add(TaskModel task) {
    final allTasks = tasks;
    tasks = [];
    tasks.add(task);
    tasks.addAll(allTasks);
    notifyListeners();
  }

  void remove(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void checkChange(int index, bool? value) {
    tasks[index].isChecked = value ?? false;
    notifyListeners();
  }
}
