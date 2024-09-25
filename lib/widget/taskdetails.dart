import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final String taskTitle;

  TaskDetailScreen({required this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(taskTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Task Details for $taskTitle',
              style: TextStyle(fontSize: 24),
            ),
            // Add more task details here
          ],
        ),
      ));}}
