import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:radaspu_2/screens/login.dart';
import 'package:radaspu_2/screens/studentauth.dart';
import 'package:radaspu_2/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Image.asset(
                  'assets/images/student1.jfif',
                  width: double.infinity,
                  height: 500,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView(children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(10, 370, 10, 0),
                    child: const Text(
                      'Welcome to',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Rada St.Pauls',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'For Your Mental Health Needs',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Sign up',
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: AppColours.black),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(AppColours.colorMain),
                          minimumSize: MaterialStateProperty.all(Size(60, 60))),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => StudentAuth()));
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(PageTransition(
                            type: PageTransitionType.leftToRightWithFade,
                            child: Login()));
                      },
                      child: const Text('Already have an account?Login',
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.black))),
                ])),
          ],
        ));
  }
}
