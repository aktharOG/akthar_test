// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitenew/provider/database_provider.dart';
import 'package:sqflitenew/screens/auth/login_screen.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dbPro = context.watch<DatabaseProvider>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sport'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: dbPro.tasks.length,
          itemBuilder: (context, index) {
            final task = dbPro.tasks[index];
            return ListTile(
              leading: Checkbox(
                value: task["isCompleted"],
                
                onChanged: (bool? value) {
                  // Handle checkbox toggle
                dbPro.onSelectTask(task).then((value) {
                  Navigator.pop(context);
                },);
                },
              ),
              title: Text(task['title']),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(
                              nameController: dbPro.taskController,
                              name: "Type your task"),
                          CustomButton(
                            name: "ADD",
                            onTap: () {
                              dbPro
                                  .onAddTaskLocal(dbPro.taskController.text)
                                  .then(
                                (value) {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: -20,
                      top: -20,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
