import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:sqflitenew/model/category.dart';

class categories {
  final String title;
  final int task;
  final String image;

  categories({
    required this.title,
    required this.task,
    required this.image,
  });
}

final List<categories> categoriesList = [
  categories(title: "home", task: 10, image: ''),
  categories(title: "sports", task: 10, image: ''),
  categories(title: "homework", task: 10, image: ''),
  categories(title: "E-learning", task: 10, image: ''),
  categories(title: "Shopping", task: 10, image: ''),
  categories(title: "Food", task: 10, image: ''),
  categories(title: "Design", task: 10, image: ''),
];

