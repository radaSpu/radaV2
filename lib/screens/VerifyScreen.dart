import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radaspu_2/screens/sign_up.dart';
import 'package:radaspu_2/screens/studentauth.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height / 2, 10, 0),
              child: Text('Verifying',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat')),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text('Your Email...',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat')),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignUpScreen()));
    }
  }
}

//   Widget circularProgress() {
//     return SpinKitFadingCircle(
//       itemBuilder: (BuildContext context, int index) {
//         return DecoratedBox(
//           decoration: BoxDecoration(
//             /*color: index.isEven ? Colors.blue : Colors.white,*/
//               shape: BoxShape.circle,
//               color: textColor),
//         );
//       },
//     );
//     //SpinKitThreeBounce
//   }
// }
