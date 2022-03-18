import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:radaspu_2/screens/login.dart';

import '../theme.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 27,
            ),
          ),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
              child: ListView(children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Password Reset',
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
                        EmailValidator(errorText: "Enter valid email id"),
                      ])),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Reset Password',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat')),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: AppColours.black))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        minimumSize: MaterialStateProperty.all(Size(60, 60))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Validated");
                        reset_password(emailController.text.trim().toString());
                      } else {
                        print("Not Validated");
                      }
                    },
                  ),
                )
              ])),
        ));
  }

  void reset_password(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      _showMyDialog();
    } on FirebaseAuthException catch (e) {
      Flushbar(
        title: 'Error',
        message: e.message,
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 30,
        ),
        duration: Duration(seconds: 3),
        isDismissible: false,
        backgroundColor: Colors.redAccent,
      )..show(context);
    }
  }

  void _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Sent'),
          insetAnimationDuration: Duration(milliseconds: 1000),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                //Text('Fetch Data.'),
                Text(
                  'Password reset link has been sent to your email',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                child: const Text('Ok',
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
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
