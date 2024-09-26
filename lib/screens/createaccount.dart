// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:sqflitenew/screens/login.dart';

class Createnewaccount extends StatefulWidget {
  const Createnewaccount({super.key});

  @override
  State<StatefulWidget> createState() => new Createnewaccount_State();
}

class Createnewaccount_State extends State<Createnewaccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.only(
                left: 10, bottom: 50, right: 22, top: 160),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 60),
                      child: const Text(
                        'Create an Account',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                ),
                CustomTextField(
                    nameController: nameController, name: "Full name"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(nameController: nameController, name: "Email"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    nameController: nameController, name: "Password"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    nameController: nameController, name: "Confirm password"),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  name: "CONTNIUE",
                  onTap: () {
                    
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text('Login',
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage(
                                    // product: allproductss,
                                    )));
                        //signup screen
                      },
                    )
                  ],
                ),
              ],
            )));
  }
}
