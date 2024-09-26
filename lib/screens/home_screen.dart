import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitenew/contants/app_images.dart';
import 'package:sqflitenew/model/todo_model.dart';
import 'package:sqflitenew/provider/database_provider.dart';
import 'package:sqflitenew/widget/category_card.dart';
import 'package:sqflitenew/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<DatabaseProvider>().onGetAllTodosSqflite();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const AddTodoDailog(),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'Categories',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leadingWidth: 100,
            leading: InkWell(
              child: const CircleAvatar(
                backgroundImage: AssetImage(AppImages.personImg),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen(
                            // product: allproductss,
                            )));
              },
            ),
            centerTitle: true,
            actions: [
              Row(
                children: [
                  const SizedBox(
                    height: 31,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ))
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shadowColor: Colors.grey.withOpacity(0.3),
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //   height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.only()),
                  alignment: Alignment.centerLeft,
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImages.personImg),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '"The memories is a shield and life helper."',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Tamim Al-bangouri',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Consumer<DatabaseProvider>(builder: (context, vm, widget) {
            //     return StreamBuilder<QuerySnapshot>(
            //         stream: vm.fireStore.collection('todo').snapshots(),
            //         builder: (context, snapshot) {
            //           if (snapshot.hasData) {
            //             snapshot.data!.docs.map((DocumentSnapshot document) {
            //               TodoModel data = TodoModel.fromJson(
            //                   jsonDecode(document.data().toString()));
            //               return GridView.builder(
            //                   gridDelegate:
            //                       const SliverGridDelegateWithFixedCrossAxisCount(
            //                     crossAxisCount: 2,
            //                     childAspectRatio: 4 / 3,
            //                     crossAxisSpacing: 16,
            //                     mainAxisSpacing: 16,
            //                   ),
            //                   shrinkWrap: true,
            //                   physics: const ScrollPhysics(),
            //                   scrollDirection: Axis.vertical,
            //                   itemCount: snapshot.data!.docs.length,
            //                   itemBuilder: (context, index) {
            //                     final allcategory = categoriesList[index];
            //                     return Categorycard(
            //                       productt: allcategory,
            //                       index: index,
            //                     );
            //                   });
            //             });
            //           }
            //           return const Center(
            //             child: Text("No Data"),
            //           );
            //         });
            //   }),
            // ),

            Expanded(child:
                Consumer<DatabaseProvider>(builder: (context, vm, widget) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: vm.todoList.length,
                  itemBuilder: (context, index) {
                    //  final allcategory = categoriesList[index];
                    return Categorycard(
                      productt: vm.todoList[index],
                      index: index,
                    );
                  });
            }))
          ],
        ));
  }
}
