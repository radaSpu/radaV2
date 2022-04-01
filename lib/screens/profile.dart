import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:radaspu_2/screens/password_reset.dart';
import 'package:radaspu_2/theme.dart';

class ProfilePage extends StatefulWidget {
  var id;

  ProfilePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String,dynamic>profile_data = {};
  Map<String,dynamic>profile = {};

  final _nameController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool checked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getProfile();
    });

  }

  Future<void> _uploadFile(PlatformFile file) async {
    String fileName = file.name;

    try {
      FormData formData = new FormData.fromMap({
        "name": "rajika",
        "age": 22,
        "file": await MultipartFile.fromFile(file.path!, filename: fileName),
      });

      scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text("Uploading, please wait...."),
        backgroundColor: Colors.green,
      ));

      Response response = await Dio()
          .post("http://rada.uonbi.ac.ke/radax/uploadprofile.php", data: formData);

      changeImage(response.data);
    } catch (e) {
      print(e);
    }
  }

  void _imagePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'webp'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text("Working, please wait...."),
          backgroundColor: Colors.blue,
        ));
        _uploadFile(file);
      }
    } catch (e) {
      print("something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black,
          fontFamily: 'Montserrat',
          fontSize: 20,
          fontWeight:FontWeight.w600),
        ),
        elevation: 10,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: FutureBuilder(
        future: getProfile(),
        builder: (BuildContext context,snapshot) {
          if (snapshot.hasData) {
            profile_data = snapshot.data as Map<String, dynamic>;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Colors.white])),
                      child: Container(
                        width: double.infinity,
                        height: 300.0,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: [
                                  CircleAvatar(
                                    // backgroundImage: NetworkImage(profile_data["image"] ==
                                    //         null
                                    //     ? "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png"
                                    //     : profile_data["image"]),
                                    radius: 50.0,
                                  ),
                                  Positioned(
                                    bottom: 3,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        _imagePicker();
                                      },
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 35,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                profile_data["username"],
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                    fontFamily: 'Montserrat'
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 0.0),
                                clipBehavior: Clip.antiAlias,
                                color: Colors.white,
                                elevation: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "University",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat'
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              profile_data["university"],
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: AppColours.colorMain,
                                                  fontFamily: 'Montserrat'
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Date of Birth",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat'
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              profile_data["date of birth"],
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: AppColours.colorMain,
                                                  fontFamily: 'Montserrat'
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Phone",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat'
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              profile_data["phone"],
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: AppColours.colorMain,
                                                  fontFamily: 'Montserrat'
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: TextField(
                              style:
                              TextStyle(color: Colors.grey, fontSize: 18),
                              controller: _nameController,
                              obscureText: false,
                              cursorWidth: 3.0,
                              cursorColor: Colors.red,
                              onChanged: (val) {
                                setState(() {
                                  checked = true;
                                });
                              },
                            ),
                          ),
                          !checked
                              ? Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 45,
                            child: ElevatedButton(
                                child: const Text('Change Password',
                                    style: TextStyle(color: Colors.white,
                                        fontFamily: 'Montserrat')),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30.0),
                                            side: BorderSide(
                                                color: AppColours.colorMain)
                                        )
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black),
                                    minimumSize: MaterialStateProperty.all(
                                        Size(60, 60))
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PasswordReset()));
                                }
                            ),

                          )
                              : SizedBox(),
                          checked
                              ? Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 45,
                            child: FlatButton(
                              onPressed: () {
                                scaffoldKey.currentState!
                                    .showSnackBar(SnackBar(
                                  content:
                                  Text("Working, please wait...."),
                                  backgroundColor: Colors.blue,
                                ));
                                changeName(_nameController.text);
                              },
                              color: Colors.blue,
                              child: Text(
                                "Change Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          else{
            return circularProgress();
          }
        }
      ),
    );
  }

  Future<Map<String,dynamic>> getProfile() async {

    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('UserData').doc(widget.id).get();
    // Get data from docs and convert map to List
    profile = snapshot.data() as Map<String,dynamic>;
    return profile;
  }

  void changeName(String user_name) async {
    var documentReference =
        FirebaseFirestore.instance.collection('Users').doc(widget.id);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.update(
        documentReference,
        {
          'name': user_name,
        },
      );
    }).then((value) {
      setState(() {
        profile_data.clear();
        getProfile();
        checked = false;
      });
    });
  }

  void changeImage(String image) async {
    var documentReference =
        FirebaseFirestore.instance.collection('Users').doc(widget.id);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.update(
        documentReference,
        {
          'image': image,
        },
      );
    }).then((value) {
      setState(() {
        profile_data.clear();
        getProfile();
      });
    });
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
