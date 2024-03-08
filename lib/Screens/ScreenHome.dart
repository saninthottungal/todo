import 'package:flutter/material.dart';

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
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 249, 241, 240),
              child: ListTile(
                leading: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                title: const Text(
                  "sample text",
                  style: TextStyle(
                      fontSize: 20,
                      // fontFamily: "Angeline",
                      color: Color.fromARGB(179, 0, 0, 0)),
                ),
                trailing: const Icon(
                  Icons.delete_outline,
                  color: Color.fromARGB(255, 255, 100, 137),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: 20,
        ),
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
                          onPressed: () {},
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
