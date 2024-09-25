import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {'title': '10 min Running', 'isCompleted': true},
    {'title': '5 min Rope Skipping', 'isCompleted': true},
    {'title': '10 Push-ups', 'isCompleted': false},
    // Add more tasks
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            leading: Checkbox(
              value: task['isCompleted'],
              onChanged: (bool? value) {
                // Handle checkbox toggle
              },
            ),
            title: Text(task['title']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new task
        },
        child: Icon(Icons.add),
     ));}}
