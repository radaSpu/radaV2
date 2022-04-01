import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'chat.dart';

String _title = "Counsellors";

List counsellors = [];

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
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.brown,),
      body: counsellors.isNotEmpty
          ? ListView.builder(
        itemCount: counsellors.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset('assets/images/Virtual_Mentorship_Icon.png'),
            title: Text(counsellors[index]["name"]!),
            subtitle: Text("Mental health and wellbeing"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyApp(name: counsellors[index]["name"]!, phone: counsellors[index]["phone"]!)
                ),
              );
            },
          );
        },
      )
          : const Center(child: Text('No items')),
    );
  }
  void getCounsellors() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('UserData').get();;

      // Get data from docs and convert map to List
      counsellors = querySnapshot.docs.map((doc) => doc.data()).toList();
      //for a specific field
      counsellors_id = querySnapshot.docs.map((doc) => doc.get('phone')).toList();

      print(counsellors_id);
    }
}

