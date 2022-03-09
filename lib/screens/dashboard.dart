import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        icon: Icon(Icons.menu,color: Colors.black),
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
          ],),
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => Information(
                        //           synced: synced,
                        //         )));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => Information(
                        //           synced: synced,
                        //         )));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => Information(
                        //           synced: synced,
                        //         )));
                      },
                      child: _cardDashBoard(
                          'Information',
                          'Knowledge is power',
                          'assets/images/Information_Icon.png'),
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
        borderRadius: BorderRadius.circular(15.0),),
    child: SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          minLeadingWidth: 10,
        leading: Icon(Icons.arrow_drop_down_circle),
        title: Text(title,
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
        fontSize: 20),
        ),
        subtitle: Text(
          description,
          style: TextStyle(color: Colors.white.withOpacity(0.6)),
        ),
  ),
      ),
    )
  );
}