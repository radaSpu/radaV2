import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import 'mentorship.dart';


class MentorShipLanding extends StatefulWidget {
  String usertype;
  String id;

  MentorShipLanding({Key? key, required this.usertype, required this.id})
      : super(key: key);

  @override
  _MentorShipLandingState createState() => _MentorShipLandingState();
}

class _MentorShipLandingState extends State<MentorShipLanding> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  List useruid = [];

  void getId() async {
    User user = await _firebaseAuth.currentUser!;
      useruid.add(user.uid);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getId();
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getId();
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Platform.isAndroid?GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.grey,
              size: 27,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ):GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 27,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Text(
                  "Virtual Mentorship",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 10),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Image.asset(
                      "assets/images/intro.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Welcome to RADA Mentoring! We are pleased that you have taken an interest in the "
                    "St Pauls University Mentorship Programme.Mentoring is an intentional and voluntary relationship between an older and younger "
                    "person or between an experienced and less experienced person based on mutual "
                    "investment of time, energy, trust and learning.",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.black87,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      child: const Text('Get Started',
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
                          minimumSize: MaterialStateProperty.all(Size(60, 60))
                      ),
                      onPressed: () {
                        Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (ctx) => Mentorship()
                           )
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
