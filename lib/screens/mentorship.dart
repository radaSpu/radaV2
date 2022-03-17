import 'package:flutter/material.dart';
import 'chat.dart';

String _title = "Mentors";

List<Map<String, String>> mentors = [
  {
    'name': 'Anne',
    'phone': '0706780121'
  },
  {
    'name': 'Mary',
    'phone': '0712345678'
  },
  {
    'name': "Tom",
    'phone': '0723546789'
  }
];

class Mentorship extends StatefulWidget {
  const Mentorship({Key? key}) : super(key: key);

  @override
  _MentorshipState createState() => _MentorshipState();
}

class _MentorshipState extends State<Mentorship> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.brown,),
      body: mentors.isNotEmpty
          ? ListView.builder(
        itemCount: mentors.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset('assets/images/Student_Counselling_Icon.png'),
            title: Text(mentors[index]["name"]!),
            contentPadding: EdgeInsets.fromLTRB(15, 10, 0, 10),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyApp(name: mentors[index]["name"]!, phone: mentors[index]["phone"]!)
                ),
              );
            },
          );
        },
      )
          : const Center(child: Text('No items')),
    );
  }
}