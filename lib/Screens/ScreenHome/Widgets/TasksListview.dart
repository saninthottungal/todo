import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/TaskProvider.dart';

class TasksListview extends StatelessWidget {
  const TasksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskClass, _) {
      return ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 249, 241, 240),
            child: ListTile(
              leading: Checkbox(
                value: taskClass.tasks[index].isChecked,
                onChanged: (value) {
                  Provider.of<TaskProvider>(context, listen: false)
                      .checkChange(index, value);
                },
              ),
              title: Text(
                taskClass.tasks[index].task,
                style: TextStyle(
                    decoration: taskClass.tasks[index].isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 20,
                    // fontFamily: "Angeline",
                    color: Color.fromARGB(179, 0, 0, 0)),
              ),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<TaskProvider>(context, listen: false)
                      .remove(index);
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Color.fromARGB(255, 255, 100, 137),
                ),
                // Icons.delete_outline,
                // color: Color.fromARGB(255, 255, 100, 137),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: taskClass.tasks.length,
      );
    });
  }
}
