// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitenew/helpers/naviagtion_helper.dart';
import 'package:sqflitenew/model/todo_model.dart';
import 'package:sqflitenew/provider/database_provider.dart';
import 'package:sqflitenew/screens/task/task_listing_screen.dart';
import 'package:sqflitenew/widgets/custom_text.dart';

import 'custom_button.dart';

class Categorycard extends StatelessWidget {
  final int index;
  final TodoModel item;
  const Categorycard({
    required this.item,
    required this.index,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
  final vm  = context.watch<DatabaseProvider>();

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
      onTap: () {
        print("tas k :  ${item.toJson()}");
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(3, 3),
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(0.4))
                ]),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      item.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${item.task}(task)",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer<DatabaseProvider>(builder: (context, vm, widget) {
                  return PopupMenuButton(
                    icon: Icon(Icons.more_vert_rounded),
                    onSelected: (value) {
                      vm.onDelete(item.id).then((value) {
                         showSnackBar(context, "Delete Success");
                      },);
                    },
                    iconColor: Colors.grey,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 0,
                        child: Text("Remove"),
                      )
                    ],
                  );
                })
              ],
            ),
          )
        ],
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
                  const CustomText(
                    name: "🤩",
                    fontsize: 60,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: value.titleController,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Title",
                        border: InputBorder.none),
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
                    child: Text(
                      "${value.selectedTaskTitle ?? 'Choose'} (task)",
                      style: const TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ),
                  CustomButton(
                    name: "ADD",
                    onTap: () {
                      if (value.titleController.text.isEmpty) {
                        showSnackBar(context, "Please enter title");
                      } else if (value.selectedTaskTitle == null) {
                        showSnackBar(context, "Please choose a task");
                      } else {
                        value.onAddTodosSQL().then(
                          (value) {
                            Navigator.pop(context);
                            showSnackBar(context,"New task added");
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
