// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitenew/model/todo_model.dart';
import 'package:sqflitenew/provider/database_provider.dart';
import 'package:sqflitenew/screens/login.dart';
import 'package:sqflitenew/screens/tasklist.dart';

class Categorycard extends StatelessWidget {
  final int index;
  final TodoModel productt;
  const Categorycard({
    required this.productt,
    required this.index,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(3, 3),
                  blurRadius: 10,
                  color: Colors.grey.withOpacity(0.4))
            ]),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const AddTodoDailog(),
            );
          },
          child: const CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: (){
        print("tas k : ${productt.task} ${productt.title}");
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(3, 3),
                  blurRadius: 10,
                  color: Colors.grey.withOpacity(0.4))
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              const Icon(
                Icons.home,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                productt.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "${productt.task}(task)",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<DatabaseProvider>(builder: (context, vm, widget) {
                    return PopupMenuButton(
                      onSelected: (value) {
                        vm.onDelete(productt.id);
                      },
                      iconColor: Colors.grey,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          child: Text("Remove"),
                          value: 0,
                        )
                      ],
                    );
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddTodoDailog extends StatelessWidget {
  const AddTodoDailog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Consumer<DatabaseProvider>(
            builder: (context, value, child) => Container(
              padding: const EdgeInsets.all(36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("🤩"),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: value.titleController,
                    decoration: const InputDecoration(
                        hintText: "Title", border: InputBorder.none),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskListScreen()));
                    },
                    child:  Text(
                      "${value.selectedTaskTitle} (task)",
                      style: const TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ),
                  CustomButton(
                    name: "ADD",
                    onTap: () {
                      if(value.titleController.text.isEmpty){

                      }else if(value.selectedTaskTitle==null){

                      }else{

  value.onAddTodosSQL().then(
                        (value) {
                          Navigator.pop(context);
                        },
                      );
                      }
                    
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -20,
            top: -20,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
