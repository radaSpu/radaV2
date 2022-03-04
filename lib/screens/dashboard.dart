import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        backgroundColor: Colors.white,),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
              Row(children: [
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
              Row(children: [
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
              Row(children: [
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
              Row(children: [
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
            ])));
  }
}

Widget _cardDashBoard(String title, String description, String image) {
  return Card(
    color: Color(0xffE4B04A),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),),
    child: Column(
        children: [
    ListTile(
    leading: Icon(Icons.arrow_drop_down_circle),
    title: Text(title),
    subtitle: Text(
      description,
      style: TextStyle(color: Colors.black.withOpacity(0.6)),
    ),
  ),
]
    )
  );
}