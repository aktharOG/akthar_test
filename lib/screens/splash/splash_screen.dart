// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sqflitenew/constants/app_images.dart';
import 'package:sqflitenew/screens/auth/login_screen.dart';
import 'package:sqflitenew/services/sqflite_db.dart';

import '../../model/todo_model.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<TodoModel> _todoList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        checkAlreadyappused();
      },
    );
  }

  checkAlreadyappused() async {
    _todoList = await DatabaseHelper().getAllTodos();
    await Future.delayed(const Duration(seconds: 2));

    setState(() {});

    if (_todoList.isNotEmpty) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    }else{
       Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
