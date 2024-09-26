import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sqflitenew/model/todo_model.dart';
import 'package:sqflitenew/services/sqflite_db.dart';

class DatabaseProvider extends ChangeNotifier {
  final fireStore = FirebaseFirestore.instance;
  DocumentReference? documentReference;

  TextEditingController titleController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController taskItemController = TextEditingController();

  List<TodoModel> _todoList = [];
  List<TodoModel> get todoList => _todoList;

  List<String> _totalTasksList = [];
  List<String> _selectedTasksList = [];

  String? selectedTaskTitle;
  Map<String, dynamic>? selectedTask;

  List<String> get totalTasksList => _totalTasksList;
  List<String> get selectedTasksList => _selectedTasksList;

  final List<Map<String, dynamic>> tasks = [
    {'title': '10 min Running', 'isCompleted': true},
    {'title': '5 min Rope Skipping', 'isCompleted': true},
    {'title': '10 Push-ups', 'isCompleted': false},
    // Add more tasks
  ];

  onAddTodo() async {
    log("Attempting to add todo...");
    try {
      DocumentReference docRef =
          await FirebaseFirestore.instance.collection('todo').add({
        'title': titleController.text,
        'task': taskController.text,
      });
      log("Todo added successfully", name: 'DatabaseProvider');
    } catch (e) {
      log("Failed to add todo: $e", name: 'DatabaseProvider');
    }
  }

  onAddTask() async {
    log("Attempting to add todo...");
    try {
      DocumentReference docRef =
          await FirebaseFirestore.instance.collection('tasks').add({
        'task': taskItemController.text,
      });
      log("Todo added successfully", name: 'DatabaseProvider');
    } catch (e) {
      log("Failed to add todo: $e", name: 'DatabaseProvider');
    }
  }

  // sqflite

  Future onAddTodosSQL() async {
    DatabaseHelper().insertTodo(TodoModel(
      title: titleController.text,
      task: selectedTaskTitle ?? "",
    ));
    print("task : $selectedTaskTitle");
    log("databse insertion completed", name: "DatabaseProvider");
    onGetAllTodosSqflite();

    notifyListeners();
  }

  onGetAllTodosSqflite() async {
    _todoList = await DatabaseHelper().getAllTodos();
    log("total todos : ${_todoList.length}", name: "DatabaseProvider");
    notifyListeners();
  }

  onDelete(id) async {
    DatabaseHelper().deleteTodoById(id);
    onGetAllTodosSqflite();
    notifyListeners();
  }

  // add tas k
  Future onAddTaskLocal(value) async {
    tasks.add(
      {'title': value, 'isCompleted': false},
    );
    notifyListeners();
  }
  // delete task

  Future onDleeteTask(int index) async {
    tasks.removeAt(index);
    notifyListeners();
  }

  Future onSelectTask(value) async {
    print("object");
    selectedTaskTitle = value["title"];
    selectedTask = value;
    value["isCompleted"] = !value['isCompleted'];
 notifyListeners();
    tasks.map(
      (e) {
        if (e != selectedTask) {
          e['isCompleted'] = false;
        }
      },
    ).toList();

    notifyListeners();
  }
}
