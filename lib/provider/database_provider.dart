import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflitenew/helpers/naviagtion_helper.dart';
import 'package:sqflitenew/model/todo_model.dart';
import 'package:sqflitenew/services/sqflite_db.dart';

class DatabaseProvider extends ChangeNotifier {
  final fireStore = FirebaseFirestore.instance;
  DocumentReference? documentReference;

  TextEditingController titleController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController taskItemController = TextEditingController();

  List<TodoModel> _todoList = [
  ];
  List<TodoModel> get todoList => _todoList;

 final List<String> _totalTasksList = [];
 final List<String> _selectedTasksList = [];

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


  // sqflite

  Future onAddTodosSQL() async {
    DatabaseHelper().insertTodo(TodoModel(
      title: titleController.text,
      task: selectedTaskTitle ?? "",
    ));
    if (kDebugMode) {
      print("task : $selectedTaskTitle");
    }
    log("databse insertion completed", name: "DatabaseProvider");
    log("title :: ${titleController.text}");
    log("task :: $selectedTaskTitle");
    titleController.clear();
    selectedTaskTitle = null;
    onGetAllTodosSqflite();

    notifyListeners();
  }

  onGetAllTodosSqflite() async {

    _todoList = await DatabaseHelper().getAllTodos();
    notifyListeners();
    log("total todos : ${_todoList.length}", name: "DatabaseProvider");
    log("items  ::: ${_todoList.map((e) => e.toJson(),)}");
        _todoList.insert(0, TodoModel(title: "sample", task: "sample"));

    notifyListeners();
  }

 Future onDelete(id) async {
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
