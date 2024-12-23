

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflitenew/constants/app_images.dart';
import 'package:sqflitenew/provider/database_provider.dart';
import 'package:sqflitenew/widgets/category_card.dart';
import 'package:sqflitenew/screens/settings/settings_screen.dart';
import 'package:sqflitenew/widgets/custom_svg.dart';

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
       
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'Categories',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
              fontSize: 18
              ),
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
                 
                 SvgIcon(path: "bx_search",
                 height: 30,
                 ),
                  const SizedBox(
                    width: 20,
                  ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
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
                                fontSize: 13,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Tamim Al-bangouri',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal, fontSize: 8,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          

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
                    //  final allcategory = categoriesList[index]
                   
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Categorycard(
                        item: vm.todoList[index],
                        index: index,
                      ),
                    );
                  });
            }))
          ],
        ));
  }
}
