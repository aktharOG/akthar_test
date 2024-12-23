
import 'package:flutter/material.dart';

import 'custom_text.dart';

showSnackBar(BuildContext context, String message,
    {Color? color,
    Duration? duration,
    double margin = 10,
    SnackBarAction? action,}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    action: action,
    //   margin: EdgeInsets.only(bottom: margin),
    elevation: 5.0,
    behavior: SnackBarBehavior.floating,

    duration: duration ?? const Duration(seconds: 1),
    content: CustomText(
      name: message,
      fontsize: 12,
      fontweight: FontWeight.bold,
      color: Colors.white,
    
      maxlines: 5,
    ),
    backgroundColor: color ?? Colors.white,
  ),);
}
