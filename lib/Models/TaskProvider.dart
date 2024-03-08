import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<String> tasks = [];

  void add(String task) {
    tasks.add(task);
    notifyListeners();
  }

  void remove(String task) {
    tasks.removeWhere((value) => value == task);
    notifyListeners();
  }

  void removeEmptyTasks() {
    tasks.removeWhere((element) => element.isEmpty);
    notifyListeners();
  }
}
