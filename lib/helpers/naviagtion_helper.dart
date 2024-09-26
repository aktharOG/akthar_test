import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message,
    {Color? color,
    Duration? duration,
    double margin = 10,
    SnackBarAction? action}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    action: action,
    //   margin: EdgeInsets.only(bottom: margin),
    elevation: 5.0,
    behavior: SnackBarBehavior.floating,

    duration: duration ?? const Duration(seconds: 1),
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    backgroundColor: color ?? const Color(0xff5473bb),
  ));
}
