import 'package:flutter/material.dart';
import 'package:radaspu_2/screens/dashboard.dart';
import 'package:radaspu_2/screens/login.dart';
import 'package:radaspu_2/screens/splashscreen.dart';
import 'package:radaspu_2/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rada Spu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( buttonColor: Colors.black ),
      /*home: GettingStartedScreen(),*/
      home: Dashboard(),
      /*routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
      },*/
    );
  }

}