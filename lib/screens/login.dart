// import 'dart:developer';
// import 'dart:ui';

// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sqflitenew/screensaju/category.dart';

// class loginpagee extends StatefulWidget {
//   const loginpagee({super.key});

//   @override
//   State<loginpagee> createState() => _loginpageeState();
// }

// class _loginpageeState extends State<loginpagee> {

//   final TextEditingController name_controller = new TextEditingController();
//   final TextEditingController password_controller = new TextEditingController();
//   late SharedPreferences registerData;
//   bool? newuser;
//   late String usernamee;
//   late String password;

//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         decoration: BoxDecoration(
//           color: Color(0xFFFFFFFF),
//         ),
//         child: Container(
//           padding: EdgeInsets.fromLTRB(0, 0, 0, 46),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 Padding(
//                   padding: const EdgeInsets.all(82),
//                   child: Container(
//                     margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
//                     child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Login Or Register To Book Your Appointments',
//                         style: GoogleFonts.getFont(
//                           'Poppins',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 24,
//                           height: 1.4,
//                           color: Color(0xFF404040),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Form(
//                     key: _formKey,
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                             // height: 450,
//                             margin: EdgeInsets.fromLTRB(20, 0, 20, 25),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.fromLTRB(8, 0, 8, 6),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'username',
//                                         style: GoogleFonts.getFont(
//                                           'Poppins',
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16,
//                                           color: Color(0xFF404040),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   TextFormField(
//                                       autofocus: false,
//                                       controller: name_controller,
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return "Enter Correct Name";
//                                         } else {
//                                           return null;
//                                         }
//                                       },
//                                       onSaved: (value) {
//                                         name_controller.text = value!;
//                                       },
//                                       // textInputAction: TextInputAction.next,
//                                       decoration: InputDecoration(
//                                         hintStyle:
//                                             TextStyle(color: Colors.grey),
//                                         //   prefixIcon: Icon(Icons.vpn_key),
//                                         contentPadding:
//                                             EdgeInsets.fromLTRB(20, 15, 20, 15),
//                                         hintText: "username",
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                         ),
//                                       )),
//                                   Container(
//                                     margin: EdgeInsets.fromLTRB(8, 0, 8, 6),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'password',
//                                         style: GoogleFonts.getFont(
//                                           'Poppins',
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16,
//                                           color: Color(0xFF404040),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 25),
//                                   SizedBox(),
//                                   TextFormField(
//                                       autofocus: false,
//                                       controller: password_controller,
//                                       obscureText: true,
//                                       validator: (value) {
//                                         RegExp regex = new RegExp(r'^.{6,}$');
//                                         if (value!.isEmpty) {
//                                           return ("Password is required for login");
//                                         }
//                                         if (!regex.hasMatch(value)) {
//                                           return ("Enter Valid Password(Min. 6 Character)");
//                                         }
//                                       },
//                                       onSaved: (value) {
//                                         password_controller.text = value!;
//                                       },
//                                       textInputAction: TextInputAction.next,
//                                       decoration: InputDecoration(
//                                         hintStyle:
//                                             TextStyle(color: Colors.grey),
//                                         //   prefixIcon: Icon(Icons.vpn_key),
//                                         contentPadding:
//                                             EdgeInsets.fromLTRB(20, 15, 20, 15),
//                                         hintText: "Password",
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                         ),
//                                       )),
//                                 ]),
//                           ),
//                         ])),
//                 Padding(
//                     padding: EdgeInsets.only(right: 10, left: 10, top: 20),
//                     child: SizedBox(
//                         width: double.infinity,
//                         // height: 50,
//                         child: ElevatedButton(
//                           onPressed: () {
//               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>category()), (route) => false);

//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color(0xFF006837),
//                             //  elevation: 10,
//                             //shape: const StadiumBorder(),
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 15,
//                               horizontal: 50,
//                             ),
//                           ),
//           //
//                           child: Text(
//                             "LOGIN",
//                           ),
//                         )))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

// }
import 'package:flutter/material.dart';
import 'package:sqflitenew/screens/category.dart';
import 'package:sqflitenew/screens/createaccount.dart';
import 'package:sqflitenew/screens/forgotpasswrd.dart';

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
                        'MIMO',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                        hintStyle: const TextStyle(color: Colors.grey),
                        //   prefixIcon: Icon(Icons.vpn_key),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                        hintStyle: const TextStyle(color: Colors.grey),
                        //   prefixIcon: Icon(Icons.vpn_key),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
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
                        'Forgot Password',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 20),
                    child: SizedBox(
                        width: double.infinity,
                        // height: 50,
                        child: ElevatedButton(
                          
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => category()),
                                (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            
                            backgroundColor: const Color(0xff5473bb),
                            //  elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            //shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 50,
                            ),
                          ),
                          //
                          child: const Text(
                            "CONTINUE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text('Register',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Createnewaccount(
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
