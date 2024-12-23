// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:sqflitenew/screens/auth/login_screen.dart';
import 'package:sqflitenew/widgets/custom_text.dart';

import '../../helpers/naviagtion_helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class Createnewaccount extends StatefulWidget {
  const Createnewaccount({super.key});

  @override
  State<StatefulWidget> createState() => Createnewaccount_State();
}

class Createnewaccount_State extends State<Createnewaccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              weight: 10,
                            )),
                        Spacer(),
                        Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Create an Account',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      nameController: nameController, name: "Full name"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      nameController: emailController, name: "Email"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      nameController: passwordController, name: "Password"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      nameController: confirmController,
                      name: "Confirm password"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    name: "CONTNIUE",
                    onTap: () {
                      if (nameController.text.isEmpty &&
                          emailController.text.isEmpty &&
                          passwordController.text.isEmpty) {
                        showSnackBar(context, "Please complete all fields");
                      } else if (passwordController.text !=
                          confirmController.text) {
                        showSnackBar(context, "passwords are not same !!");
                      } else {
                        showSnackBar(context,
                            "Registration successfull please login ${nameController.text}",
                            action: SnackBarAction(label: "Login", onPressed: (){
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage(
                                      // product: allproductss,
                                      )));
                            })
                            );
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Already have an account?'),
                      TextButton(
                        child: CustomText(
                          name: 'Login',
                          fontweight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                        ),
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
              ),
            ),
          ),
        ));
  }
}
