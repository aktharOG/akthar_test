import 'package:flutter/material.dart';
import 'package:sqflitenew/screens/home_screen.dart';
import 'package:sqflitenew/screens/createaccount.dart';
import 'package:sqflitenew/screens/forgotpasswrd.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ForgotPasswordScreen_State();
}

class ForgotPasswordScreen_State extends State<ForgotPasswordScreen> {
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
            padding: EdgeInsets.only(left: 10, bottom: 50, right: 22, top: 160),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 60),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                ),
                 Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                                      autofocus: false,
                                      controller: passwordController,
                                      obscureText: true,
                                      validator: (value) {
                                        RegExp regex = new RegExp(r'^.{6,}$');
                                        if (value!.isEmpty) {
                                          return ("Password is required for login");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("Enter Valid Password(Min. 6 Character)");
                                        }
                                      },
                                      onSaved: (value) {
                                        passwordController.text = value!;
                                      },
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        //   prefixIcon: Icon(Icons.vpn_key),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(20, 15, 20, 15),
                                        hintText: "Password",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(
                                // product: allproductss,
                                )));
                  },
                  child: Text(
                    'Enter the email address you used to create your account and we will send you a link to reset your password',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 10, left: 10, top: 20),
                    child: SizedBox(
                        width: double.infinity,
                        // height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>category()), (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 54, 78, 210),
                            //  elevation: 10,
                            //shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 50,
                            ),
                          ),
                          //
                          child: Text(
                            "Create",
                          ),
                        ))),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    TextButton(
                      child: Text('Register',
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Createnewaccount(
                                    // product: allproductss,
                                    )));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
