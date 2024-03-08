import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/TaskProvider.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final taskController = TextEditingController();

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
            ? const Center(
                child: Text(
                "Try adding a Task !",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ))
            : Consumer<TaskProvider>(builder: (context, taskClass, _) {
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
              }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 255, 100, 137),
        icon: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        label: const Text("New Task",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            )),
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  actions: [
                    const SizedBox(height: 25),
                    TextField(
                      controller: taskController,
                      maxLength: 25,
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
                            Provider.of<TaskProvider>(context, listen: false)
                                .add(taskController.text.trim());
                            Navigator.of(ctx).pop();
                            taskController.clear();

                            Provider.of<TaskProvider>(context, listen: false)
                                .removeEmptyTasks();
                          },
                          child: const Text("Add"),
                        ),
                      ],
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}
