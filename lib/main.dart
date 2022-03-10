import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:radaspu_2/screens/dashboard.dart';
import 'package:radaspu_2/screens/login.dart';
import 'package:radaspu_2/screens/sign_up.dart';
import 'package:radaspu_2/screens/splashscreen.dart';
import 'package:radaspu_2/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SplashScreen(),
      /*routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
      },*/
    );
  }

}