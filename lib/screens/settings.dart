import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/user_avatar.png'), // Replace with your asset
            ),
            title: Text('Kate Vincent'),
            subtitle: Text('Hi, I’m Kate, a community manager.'),
          ),
          Divider(),
          ListTile(
            title: Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Appearance'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Account'),
            onTap: () {},
          ),
        ],
    ));}}
