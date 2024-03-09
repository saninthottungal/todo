import 'package:hive_flutter/hive_flutter.dart';
part 'TaskModel.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String task;
  @HiveField(1)
  bool isChecked = false;

  TaskModel({
    required this.task,
  });
}
