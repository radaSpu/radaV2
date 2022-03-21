import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:radaspu_2/screens/help.dart';
import 'package:radaspu_2/screens/notification.dart';
import 'package:radaspu_2/screens/profile.dart';
import 'package:radaspu_2/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Information.dart';
import 'contributors.dart';
import 'login.dart';
import 'mentorshiplanding.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static const IconData menu = IconData(0x0000, fontFamily: 'MaterialIcons');
  bool? synced;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool fetched = false;
  List useruid = [];
  late Map details;

  void getId() async {
    User user = await _firebaseAuth.currentUser!;
    useruid.add(user.uid);
  }

  void getSynced() async {
    late Map d;
    try {
      User user = await _firebaseAuth.currentUser!;
      FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .get()
          .then((value) {
        FirebaseFirestore.instance
            .collection("Mentors")
            .doc(user.uid)
            .collection("requests").get()
            .then((reqs) {
          synced = true;
          Map<String, dynamic> data = value.data() as Map<String, dynamic>;
          d = {
            "synced": data['synced'],
            "name": data['name'],
            "user_type": data['user_type'],
            "count": reqs.docs.length
          };
        }).then((value) {
          details = d;
          setState(() {
            fetched = true;
          });
        });
      });
    }
    catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // detailsHelper = DetailsHelper();
    setState(() {
      getId();
    });

    getSynced();

    //shared();

    //sayOnline();

    /*_firebaseMessaging.getToken().then((deviceToken) {
      print(deviceToken);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.menu, color: Colors.black),
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                const PopupMenuItem<String>(
                  value:'Profile',
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Profile'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value:'Contributors',
                  child: ListTile(
                    leading: Icon(Icons.anchor),
                    title: Text('Contributors'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value:'Logout',
                  child: ListTile(
                    leading: Icon(Icons.article),
                    title: Text('Logout'),
                  ),
                ),
              ],
              enabled: true,
              onSelected: (str) {
                if (str == "Logout") {
                  signOut();
                  print("clicked");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login()),
                  );
                } else if (str == "Profile") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          id: useruid[0],
                        )),
                  );
                } else if (str == "Contributors") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Contributors()));
                }
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: ListView(children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(3, 10, 0, 10),
                child: const Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Information(synced: synced)));
                      },
                      child: _cardDashBoard('Information', 'Knowledge is power',
                          'assets/images/Information_Icon.png'),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (ctx) => Information(
                        //             synced: synced,
                        //           )));
                      },
                      child: _cardDashBoard(
                          'Student Counselling',
                          'Free Professional Counselling',
                          'assets/images/Student_Counselling_Icon.png'),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => Information(
                        //           synced: synced,
                        //         )));
                      },
                      child: _cardDashBoard(
                          'Student Forums',
                          'Share with the Group',
                          'assets/images/Student_Forum_Icon.png'),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => Notifications()));
                      },
                      child: _cardDashBoard(
                          'Quick Notification',
                          'Instant Notification',
                          'assets/images/Quick_Notification_Icon.png'),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Help()));
                      },
                      child: _cardDashBoard('Help', 'Locations and Contacts',
                          'assets/images/HELP_Icon.png'),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => MentorShipLanding(
                                  usertype: "user",
                                  id: useruid[0],
                                )));
                      },
                      child: _cardDashBoard(
                          'Student Mentorship',
                          'Mentorship Programs',
                          'assets/images/Virtual_Mentorship_Icon.png'),
                    ),
                  ),
                ]),
              ),
            ])));
  }

  void signOut() async {
    return _firebaseAuth.signOut();
  }

}

Widget _cardDashBoard(String title, String description, String image) {
  return Card(
      color: AppColours.colorMain,
      elevation: 30,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            minLeadingWidth: 10,
            leading: Image.asset(image),
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  fontSize: 20),
            ),
            subtitle: Text(
              description,
              style: TextStyle(color: Colors.white.withOpacity(0.6),
                fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ));
}
