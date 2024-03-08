import 'package:flutter/material.dart';
import 'package:todo/Models/TaskModel.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  void add(TaskModel task) {
    tasks.add(task);
    notifyListeners();
  }

  void remove(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
