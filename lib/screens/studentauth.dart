import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:radaspu_2/screens/dashboard.dart';
import 'package:radaspu_2/screens/sign_up.dart';
import 'package:radaspu_2/theme.dart';
import 'package:radaspu_2/utils/validator.dart';

import 'VerifyScreen.dart';
import 'login.dart';

class StudentAuth extends StatefulWidget {
  const StudentAuth({Key? key}) : super(key: key);


  @override
  _StudentAuthState createState() => _StudentAuthState();
}

class _StudentAuthState extends State<StudentAuth> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late User user;
  String password = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _showButton = true;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
              child: ListView(
                  children: <Widget>[

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'School Email',
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            //schoolEmailValidator(errorText: "Enter valid school email")
                          ])
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'Password',
                          ),
                          onChanged: (val) => password = val,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            MinLengthValidator(6,
                                errorText: "Password should be atleast 6 characters"),
                            MaxLengthValidator(15,
                                errorText:
                                "Password should not be greater than 15 characters")
                          ])
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: TextFormField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'Confirm Password',
                          ),
                          validator: (val) => MatchValidator(errorText: 'passwords do not match').validateMatch(val!, password),
                      ),
                    ),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Verify Email',
                            style: TextStyle(color: Colors.white,
                                fontFamily: 'Montserrat')),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: AppColours.black)
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.black),
                            minimumSize: MaterialStateProperty.all(Size(80, 80))
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _authenticate(emailController.text.trim(),
                                passwordController.text.trim());
                            print("Validated");
                          } else {
                            print("Not Validated");
                          }
                        },
                      ),

                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text('Already have an account?Login',
                          style: TextStyle(color: Colors.black),)
                    ),

                  ]
              )
          ),
        )
    );
  }

  void _authenticate(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = await _firebaseAuth.currentUser!;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerifyScreen()));
      await user.sendEmailVerification();
      if (user.emailVerified) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignUpScreen()));
      }
      else {
        Flushbar(
          title: 'Authentication Failed',
          message: 'Verify your email',
          icon: Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 30,
          ),
          duration: Duration(seconds: 3),
          isDismissible: false,
          backgroundColor: Colors.redAccent,
        )
          ..show(context);
      }
    }
  }

}
