import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:radaspu_2/screens/dashboard.dart';
import 'package:radaspu_2/theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
    body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
        child: ListView(
          children: <Widget>[

            Container(
              alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat'),
                ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'School Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',
                style: TextStyle(color: Colors.black),),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Log In',
                    style: TextStyle(color: Colors.white,
                    fontFamily: 'Montserrat')),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: AppColours.black)
                            )
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(60,60))
                    ),
                  onPressed: () {
                    Navigator.of(context).push(PageTransition(
                        type: PageTransitionType.leftToRightWithFade, child: Dashboard()));
                  },
                ),

            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Does not have an account',
              style: TextStyle(color: Colors.black),)
            ),

    ]
    )
    )
    );
  }
}

