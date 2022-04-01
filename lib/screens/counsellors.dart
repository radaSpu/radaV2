import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:radaspu_2/theme.dart';
import 'chat.dart';

String _title = "Counsellors";

List counsellors = [];

List counsel = [];

List counsellors_id= [];

class CounsellorsHome extends StatefulWidget {
  const CounsellorsHome({Key? key}) : super(key: key);

  @override
  _CounsellorsHomeState createState() => _CounsellorsHomeState();
}



class _CounsellorsHomeState extends State<CounsellorsHome> {
  @override
  void initState() {
    // TODO: implement initStater
    super.initState();
    // detailsHelper = DetailsHelper();
    setState(() {
      getCounsellors();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: AppColours.colorMain,),
      body:FutureBuilder(
        future: getCounsellors(),
        builder: (context, projectSnap) {
    if (projectSnap.hasData) {
      counsellors = projectSnap.data! as List<dynamic>;
    return ListView.builder(
    itemCount: counsellors.length,
    itemBuilder: (BuildContext context, int index) {
    return ListTile(
    leading: Image.asset('assets/images/Virtual_Mentorship_Icon.png'),
    title: Text(counsellors[index]["username"]),
    subtitle: Text("Mental health and wellbeing"),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => MyApp(name: counsellors[index]["username"], phone: counsellors[index]["phone"])
    ),
    );
    },
    );
    },
    );
    }
    else{
    return circularProgress();
    }
    }
    )
    );
  }
  Future<List> getCounsellors() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('UserData').get();

      // Get data from docs and convert map to List
      counsel = querySnapshot.docs.map((doc) => doc.data()).toList();


      return counsel;
      //for a specific field
      counsellors_id = querySnapshot.docs.map((doc) => doc.get('phone')).toList();

    }
  Widget circularProgress() {
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            /*color: index.isEven ? Colors.blue : Colors.white,*/
              shape: BoxShape.circle,
              color: AppColours.colorMain),
        );
      },
    );
  }
}

