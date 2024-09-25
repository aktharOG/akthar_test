import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitenew/model/category.dart';
import 'package:sqflitenew/screens/category.dart';

class Categorycard extends StatelessWidget {
   final categories productt;
  const Categorycard({
  required this.productt,

    super.key,
  });
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: IconButton(onPressed: () {
              
            }, icon: Icon(Icons.home))
          ),
          SizedBox(
            height: 10,
          ),
          Text(
      productt.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
          productt.task.toString(),
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red),
          ),
         
        ],
      ),
    );
  }
}
