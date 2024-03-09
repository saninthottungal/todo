import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/Database/DatabaseModel/TaskModel.dart';

class DBFunction {
  Future<void> addHive(TaskModel task) async {
    final db = await Hive.openBox<TaskModel>("task");
    await db.add(task);
  }

  Future<void> removeHive(TaskModel task) async {
    final db = await Hive.openBox<TaskModel>("task");
    await db.delete(task.key);
  }

  Future<void> checkHive(TaskModel task, bool? value) async {
    final db = await Hive.openBox<TaskModel>("task");
    final taskFromDB = db.get(task.key);
    if (taskFromDB != null) {
      taskFromDB.isChecked = value ?? false;
      await db.put(task.key, task);
    }
  }
}
