import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:radaspu_2/screens/help.dart';

import 'Information.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static const IconData menu = IconData(0x0000, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.menu, color: Colors.black),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Profile'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.anchor),
                    title: Text('Contributors'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.article),
                    title: Text('Logout'),
                  ),
                ),
              ],
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => Information(
                                )));
                      },
                      child: _cardDashBoard(
                          'Information',
                          'Knowledge is power',
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => Information(
                        //           synced: synced,
                        //         )));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => Help(
                                )));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => Information(
                        //           synced: synced,
                        //         )));
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
}

Widget _cardDashBoard(String title, String description, String image) {
  return Card(
      color: Color(0xffE4B04A),
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
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  fontSize: 20),
            ),
            subtitle: Text(
              description,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ),
      ));
}
