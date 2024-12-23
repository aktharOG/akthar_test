
import 'package:flutter/material.dart';
import 'package:sqflitenew/constants/app_images.dart';
import 'package:sqflitenew/screens/home/home_screen.dart';
import 'package:sqflitenew/screens/auth/register_screen.dart';
import 'package:sqflitenew/screens/auth/forget_password_screen.dart';
import 'package:sqflitenew/widgets/custom_button.dart';
import 'package:sqflitenew/widgets/custom_text.dart';

import '../../widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Image.asset(AppImages.logo),
                      // const Text(
                      //   'MIMO',
                      //   style: TextStyle(
                      //       color: Color.fromARGB(255, 0, 0, 0),
                      //       fontWeight: FontWeight.w500,
                      //       fontSize: 30),
                      // ),
                    ),
                  ),
                  CustomTextField(nameController: nameController, name: "Email",
                
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      nameController: passwordController, name: "Pasword"),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(
                                      // product: allproductss,
                                      )));
                        },
                        child: const Text(
                          'Forgot Password ? ',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    name: 'CONTINUE',
                    onTap: 
                    // (nameController.text.isEmpty &&
                    //         passwordController.text.isEmpty)
                    //     ? null
                    //     :
                         () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                          },
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const CustomText(name:"Dont't have an account?",
                      color: Colors.grey,
                      fontweight: FontWeight.bold,
                      fontsize: 13,
                      ),
                      TextButton(
                        child: CustomText(name: "Register",decoration: TextDecoration.underline,fontweight: FontWeight.bold,
                        decorationColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Createnewaccount(
                                      // product: allproductss,
                                      )));
                          //signup screen
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
