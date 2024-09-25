import 'package:flutter/material.dart';
import 'package:sqflitenew/screens/category.dart';
import 'package:sqflitenew/screens/createaccount.dart';
import 'package:sqflitenew/screens/forgotpasswrd.dart';
import 'package:sqflitenew/screens/login.dart';


class Createnewaccount extends StatefulWidget {

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
            padding: EdgeInsets.only(left: 10,bottom: 50,right: 22,top: 160),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 60),
                      child: Text(
                        'Create an Account',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child:    TextFormField(
                                      autofocus: false,
                                      controller: nameController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Correct Name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        nameController.text = value!;
                                      },
                                      // textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        //   prefixIcon: Icon(Icons.vpn_key),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(20, 15, 20, 15),
                                        hintText: "full name",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )),
                                      
                ),    Container(
                  padding: EdgeInsets.all(10),
                  child:    TextFormField(
                                      autofocus: false,
                                      controller: nameController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Correct Name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        nameController.text = value!;
                                      },
                                      // textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        //   prefixIcon: Icon(Icons.vpn_key),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(20, 15, 20, 15),
                                        hintText: "email",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
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
                                        hintText: "Confirm Password",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
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
                            "CONTINUE",
                          ),
                        ))),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        TextButton(
                          child: Text(
                            'Login',style: TextStyle(color: Colors.black,fontSize: 20)
                          
                          ),
                          onPressed: () {
                             Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                          // product: allproductss,
                          )));
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
              ],
            )));
  }
}
