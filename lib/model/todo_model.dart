// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class TodoModel {
  final int? id;
  final String title;
  final String task;
 // final String image;

  TodoModel({
    required this.title,
    required this.task,
    this.id
 //   required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'task': task,
      'id':id
   //   'image': image,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] as String,
      task: map['task'] as String,
      id: map['id'] as int
    //  image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// final List<TodoModel> categoriesList = [
//   TodoModel(title: "home", task: "10", image: ''),
//   TodoModel(title: "sports", task: "10", image: ''),
//   TodoModel(title: "homework", task: "10", image: ''),
//   TodoModel(title: "E-learning", task: "10", image: ''),
//   TodoModel(title: "Shopping", task: "10", image: ''),
//   TodoModel(title: "Food", task: "10", image: ''),
//   TodoModel(title: "Design", task: "10", image: ''),
// ];

