import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:radaspu_2/screens/login.dart';


import '../theme.dart';

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

  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();
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
                        'Tell us a litte bit about yourself...',
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
                          obscureText: true,
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
                        obscureText: true,
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
                            obscureText: true,
                            controller: dobController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              labelText: 'Date of Birth',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: genderController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          labelText: 'Gender',
                        ),
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
      });
  }
}

// void storeToMysql(String userid) async {
//   //Mysql Part Start
//   http.Response response = await http
//       .post('http://rada.uonbi.ac.ke/radaweb/api/api/user/signup', headers: {
//     "Accept": "application/json"
//   }, body: {
//     "user_id": userid,
//     "name": widget.name,
//     "dob": DateTime.now().toString(),
//     "image": "user_image",
//     "account_status": "1",
//     "email": widget.email,
//     "campus_id": widget.campus,
//     "joined": DateTime.now().toString(),
//     "phone_id":
//     "SCVBSCBW8E8R9EWRF8R8FUSDJSKVPOXDBUR8EREBVUDFYEUREFYRREUREFHBD8E89E",
//     "phone": widget.phone.toString(),
//     "gender": _dropDownValue2.toString(),
//     "mentorship_status": "false"
//   });
// }