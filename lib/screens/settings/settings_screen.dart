// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sqflitenew/constants/app_images.dart';
import 'package:sqflitenew/helpers/naviagtion_helper.dart';
import 'package:sqflitenew/screens/auth/login_screen.dart';
import 'package:sqflitenew/services/sqflite_db.dart';
import 'package:sqflitenew/widgets/custom_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const ListTile(
              trailing: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              leading: CircleAvatar(
                  radius: 30, backgroundImage: AssetImage(AppImages.personImg)),
              title: Text(
                'Malak Idrssl',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Rabart, Morocco',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "Hi! My name is Malak, I'am a community manager from Robat, Morocco"),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text(
                'Notifications',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'General',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                'Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              onTap: () {},
            ),
            CustomButton(
              name: "Logout",
              onTap: () async {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                    showSnackBar(context, "Logout success");
              
              },
            )
          ],
        ));
  }
}
