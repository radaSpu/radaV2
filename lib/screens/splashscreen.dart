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
        backgroundColor: AppColours.colorMain,
        body: Padding(
            padding:  EdgeInsets.all(10.0),
            child: ListView(children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: const Text(
                  'Welcome to',
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 35,
                    fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Rada St.Pauls',
                  style: TextStyle(fontSize: 35,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'For Your Mental Health Needs',
                  style: TextStyle(fontSize: 16,
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Rada_SPU_Logo.png',
                      width: double.infinity,
                      height: 150,
                    ),
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign up',
                      style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: AppColours.black),

                          )

                      ),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(60,60))
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => StudentAuth()));
                  },
                ),

              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(PageTransition(
                        type: PageTransitionType.leftToRightWithFade, child: Login()));
                  },
                  child: const Text('Already have an account?Login',
                  style: TextStyle(fontFamily: 'Montserrat',color: Colors.black))
              ),
            ])));
  }
}
