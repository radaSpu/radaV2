import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:radaspu_2/screens/login.dart';
import 'package:http/http.dart' as http;

import '../theme.dart';
import 'dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  DateTime selectedDate = DateTime.now();
  String gender='Female';
  late User user;
  final _formKey = GlobalKey<FormState>();

  void getId() async {
    user = await _firebaseAuth.currentUser!;
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
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 0),
              child: ListView(
                  children: <Widget>[

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Tell us a little bit about yourself...',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'Username',
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required")
                          ])
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'Phone Number',
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ])
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: TextFormField(
                        controller: universityController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          labelText: 'Select University',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: InkWell(
                        onTap: () {
                          _selectDate(context);   // Call Function that has showDatePicker()
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: dobController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              labelText: 'Date of Birth',
                            ),
                            onChanged: (val) => print,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: DropDownFormField(
                          titleText: 'Gender',
                            hintText: 'Please choose one',
                          validator:  MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          ]),
                          value: gender,
                          onSaved: (value) {
                            setState(() {
                              gender= value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                          dataSource: [
                          {
                          "display": "Male",
                          "value": "Male",
                          },
                          {
                            "display": "Female",
                            "value": "Female",
                          },
                          ],
                          textField: 'display',
                          valueField: 'value',
                    ),
                    ),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Register',
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
                            minimumSize: MaterialStateProperty.all(Size(80, 80))
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Validated");

                            storeToFirestore(usernameController.text.toString(), genderController.text.toString(),
                                phoneController.text.toString(), universityController.text.toString(), dobController.text.toString());
                          } else {
                            print("Not Validated");
                          }
                        },
                      ),

                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text('Already have an account?Login',
                          style: TextStyle(color: Colors.black),)
                    ),

                  ]
              )
          ),
        )
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: selectedDate,
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        dobController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }



  void storeToFirestore(String username, String gender, String phone, String university,String dob ) {
    if (user.emailVerified) {
      // FirebaseFirestore.instance.collection("UserData").doc(user.uid).set({
      //   "email": user.email,
      //   "username": username,
      //   "gender": gender,
      //   "phone": phone,
      //   "university": university,
      //   "date of birth": dob
      // }).then((value) => {
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Dashboard()));
      // });
    }
    else {
      Flushbar(
        title: 'You email is not verified',
        message: 'Verify your email',
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 30,
        ),
        duration: Duration(seconds: 3),
        isDismissible: false,
        backgroundColor: Colors.redAccent,
      )
        ..show(context);
    }
  }
  // void storeToMysql(String userid) async {
  //   //Mysql Part Start
  //   http.Response response = await http
  //       .post('http://rada.uonbi.ac.ke/radaweb/api/api/user/signup', headers: {
  //     "Accept": "application/json"
  //   }, body: {
  //     "user_id": userid,
  //     "name": usernameController.text.trim(),
  //     "dob": dobController.text.trim(),
  //     "image": "user_image",
  //     "account_status": "1",
  //     "email": emailController.text.trim(),
  //     "campus_id": universityController.text.trim(),
  //     "joined": DateTime.now().toString(),
  //     "phone_id":
  //     "SCVBSCBW8E8R9EWRF8R8FUSDJSKVPOXDBUR8EREBVUDFYEUREFYRREUREFHBD8E89E",
  //     "phone": phoneController.text.trim(),
  //     "gender": genderController.text.trim(),
  //     "mentorship_status": "false"
  //   });
  // }
}

