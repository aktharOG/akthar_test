import 'package:flutter/material.dart';
import 'package:sqflitenew/helpers/naviagtion_helper.dart';
import 'package:sqflitenew/screens/auth/register_screen.dart';
import 'package:sqflitenew/widgets/custom_button.dart';
import 'package:sqflitenew/widgets/custom_textfield.dart';

import '../../widgets/custom_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => ForgotPasswordScreen_State();
}

class ForgotPasswordScreen_State extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.only(left: 10, bottom: 50, right: 22, top: 160),
            child: ListView(
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
                            Icons.arrow_back_sharp,
                            weight: 10,
                          )),
                      Spacer(),
                      Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Forget Password',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    nameController: emailController, name: "Email"),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Enter the email address you used to create your account and we will send you a link to reset your password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20,),
                CustomButton(
                  name: "CONTINUE",
                  onTap: () {
                    showSnackBar(context, "Your password is successfully sent to ${emailController.text}");
                  },
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" Don't have an account?"),
                    TextButton(
                      child: CustomText(
                        name: "Register",
                        decoration: TextDecoration.underline,
                        fontweight: FontWeight.bold,
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
            )));
  }
}
