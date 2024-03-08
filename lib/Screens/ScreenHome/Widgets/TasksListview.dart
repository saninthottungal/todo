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
                value: true,
                onChanged: (value) {},
              ),
              title: Text(
                taskClass.tasks[index],
                style: const TextStyle(
                    fontSize: 20,
                    // fontFamily: "Angeline",
                    color: Color.fromARGB(179, 0, 0, 0)),
              ),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<TaskProvider>(context, listen: false)
                      .remove(taskClass.tasks[index]);
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
