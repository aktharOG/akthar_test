import 'package:flutter/material.dart';
import 'package:sqflitenew/model/category.dart';
import 'package:sqflitenew/widget/category_card.dart';
import 'package:sqflitenew/screens/createaccount.dart';
import 'package:sqflitenew/screens/settings.dart';
import 'package:sqflitenew/screens/tasklist.dart';

class category extends StatelessWidget {
  // final List<Map<String, dynamic>> categories = [
  //   {'title': 'Home', 'tasks': 10, 'icon': Icons.home},
  //   {'title': 'Sport', 'tasks': 6, 'icon': Icons.sports_soccer},
  //   {'title': 'Homework', 'tasks': 13, 'icon': Icons.book},
  //   {'title': 'E-learning', 'tasks': 4, 'icon': Icons.school},
  //   {'title': 'Shopping', 'tasks': 9, 'icon': Icons.shopping_cart},
  //   {'title': 'Food', 'tasks': 1, 'icon': Icons.fastfood},
  //   {'title': 'Design', 'tasks': 3, 'icon': Icons.design_services},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: Text(
              'Categories',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: InkWell(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.shutterstock.com/shutterstock/photos/2122700972/display_1500/stock-photo-image-of-young-asian-woman-company-worker-in-glasses-smiling-and-holding-digital-tablet-standing-2122700972.jpg"),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingsScreen(
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
                      icon: Icon(
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
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only()),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '"The memories is a shield and life helper."',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              // child: GridView.builder(
              //   padding: EdgeInsets.all(16.0),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 16,
              //     mainAxisSpacing: 16,
              //   ),
              //   itemCount: categories.length + 1,
              //   itemBuilder: (context, index) {
              //     if (index == 0) {
              //       return Card(
              //         child: Center(
              //             child: IconButton(
              //                 onPressed: () {}, icon: Icon(Icons.add))),
              //       );
              //     }
              //     final category = categories[index - 1];
              //     return Card(
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Icon(category['icon'], size: 40),
              //             SizedBox(height: 10),
              //             Text(category['title']),
              //             SizedBox(height: 5),
              //             Text('${category['tasks']} tasks'),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),

              child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (120 / 140),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: categoriesList.length,
      itemBuilder: (context, index) {
final allcategory = categoriesList[index];
        return GestureDetector(
            onTap: () {
            
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskListScreen(
                          )));
            },
            child: Categorycard(
            productt:allcategory
            ));
      })
            ),
          ],
        ));
  }
  
}