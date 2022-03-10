import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:radaspu_2/theme.dart';
import 'package:state_persistence/state_persistence.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  final List<Map> imgList = [];
  final List<Map> newsList = [];
  int dsync = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 27,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: GestureDetector(
                  onTap: () {
                    // fetchData();
                  },
                  child: Icon(
                    Icons.sync,
                    size: 27,
                    color: Colors.black,
                  )))
        ],
        title: Text(
          "Rada Information",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            //customize color here
          ),
        ),
      ),
       body:
       // PersistedStateBuilder(builder:
      //     (BuildContext context, AsyncSnapshot<PersistedData> snapshot) {
      //   if (snapshot.hasData) {
      //     return
      ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: AppColours.colorMain,
                      child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "News And Other Announcements",
                              style: TextStyle(
                                  fontFamily: 'Raleway-regular',
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  height: 210,
                  child:
                  imgList.isEmpty
                      ? Center(
                    child: Text("Fetching News ..."),
                  )
                      : CarouselSlider.builder(
                    itemCount: imgList.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: false,
                      reverse: true,
                      pauseAutoPlayOnTouch: true,
                    ),
                    itemBuilder: (context, int index,int pageViewIndex) {
                      return GestureDetector(
                        onTap: () {
                          print(imgList[index]["content"]);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (ctx) => ArticlePage(
                          //           title: imgList[index]["title"],
                          //           image: imgList[index]["image"],
                          //           content: imgList[index]
                          //           ["content"],
                          //         )));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 2, right: 2),
                          child: Container(
                            child: Stack(
                              children: <Widget>[
                                CachedNetworkImage(
                                    imageUrl: imgList[index]["image"],
                                    imageBuilder:
                                        (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter:
                                              const ColorFilter
                                                  .mode(
                                                Colors.white,
                                                BlendMode.colorBurn,
                                              ),
                                            ),
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                        Center(
                                            child: circularProgress()),
                                    errorWidget:
                                        (context, url, error) =>
                                    const Center(
                                      child: Icon(
                                        Icons.error,
                                        size: 40,
                                      ),
                                    )),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                      constraints: new BoxConstraints(
                                        minHeight: 20.0,
                                        maxHeight: 60.0,
                                      ),
                                      //height: 50,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width,
                                      color: Colors.black54,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 2,
                                            right: 50,
                                            left: 5,
                                            bottom: 2),
                                        child: Wrap(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 2,
                                                  right: 5,
                                                  left: 5,
                                                  bottom: 2),
                                              child: Text(
                                                imgList[index]["title"],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    'Raleway-regular'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      // _shareText(
                                      //     imgList[index]["content"]);
                                    },
                                    child: Icon(
                                      Icons.share,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: AppColours.colorMain,
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Alcohol & Drug Abuse",
                                style: TextStyle(
                                    fontFamily: 'Raleway-regular',
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      listCard(
                          'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/drugs.jpg',
                          "Weed",
                          1,
                          "6",
                          dsync),
                      listCard(
                          'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/heroine.jpg',
                          "Heroine",
                          2,
                          "6",
                          dsync),
                      listCard(
                          'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/alcohol.jpg',
                          "Alcohol",
                          3,
                          "6",
                          dsync),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: AppColours.colorMain,
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Sexual & Reproductive Health",
                                style: TextStyle(
                                    fontFamily: 'Raleway-regular',
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/romance.jpg',
                        "Relationships",
                        5,
                        "3",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/pregnancy.jpg',
                        "Pregnancy",
                        6,
                        "3",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/contraception.jpg',
                        "Contraception",
                        7,
                        "3",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/bacteria.png',
                        "STIs",
                        8,
                        "3",
                        dsync)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: AppColours.colorMain,
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "General Health",
                                style: TextStyle(
                                    fontFamily: 'Raleway-regular',
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/communicable.jpg',
                        "Non Communicable...",
                        13,
                        "8",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/food.jpg',
                        "Nutrition",
                        14,
                        "8",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/hygiene.png',
                        "Personal Hygiene",
                        15,
                        "8",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/physical.jpg',
                        "Physical Activities",
                        16,
                        "8",
                        dsync),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: AppColours.colorMain,
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Mental Health",
                                style: TextStyle(
                                    fontFamily: 'Raleway-regular',
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/illness.jpg',
                        "Mental Illnesses",
                        9,
                        "7",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/suicide.jpg',
                        "Suicide",
                        10,
                        "7",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/eating.jpg',
                        "Eating disorders",
                        11,
                        "7",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/help.jpg',
                        "Get Help",
                        12,
                        "7",
                        dsync)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: AppColours.colorMain,
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Safety",
                                style: TextStyle(
                                    fontFamily: 'Raleway-regular',
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/dating.jpg',
                        "Dating",
                        13,
                        "5",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/gbv.jpg',
                        "GBV",
                        14,
                        "5",
                        dsync),
                    listCard(
                      /*'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/ccrime.png',*/
                        "https://1c7fab3im83f5gqiow2qqs2k-wpengine.netdna-ssl.com/wp-content/uploads/2018/05/cybercrimedirectory.jpg",
                        "Cyber Crimes",
                        15,
                        "5",
                        dsync),
                    /*listCard(
                          'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/safety.jpg',
                          "Safety Tips",
                          16,
                          "5",
                          dsync),*/
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/csafety.jpg',
                        "Campus Safety",
                        16,
                        "5",
                        dsync),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: AppColours.colorMain,
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "HIV & AIDS",
                                style: TextStyle(
                                    fontFamily: 'Raleway-regular',
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/romance.jpg',
                        "HIV",
                        13,
                        "4",
                        dsync),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: AppColours.colorMain,
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Career & Financial Management",
                                style: TextStyle(
                                    fontFamily: 'Raleway-regular',
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/coins.jpg',
                        "College Financial...",
                        13,
                        "9",
                        dsync),
                    listCard(
                        'http://rada.uonbi.ac.ke/radaweb/appimages/dashboard/career.jpg',
                        "Career",
                        14,
                        "9",
                        dsync),
                  ],
                ),
              ),
            ],
          )
    );
        }

Widget circularProgress() {
  return SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          /*color: index.isEven ? Colors.blue : Colors.white,*/
            shape: BoxShape.circle,
            color: Colors.white),
      );
    },
  );
}

Widget listCard(img, name, id, itemkey, synced) {
  return PersistedAppState(child: PersistedStateBuilder(
      builder: (BuildContext context, AsyncSnapshot<PersistedData> snapshot) {
        return GestureDetector(
          onTap: () {
            print("Pressed");
            //print(snapshot.data["synced"]);
            /*if(widget.synced==false){*/
            /*if(snapshot.data["synced"]==false){*/
            if (synced == 0 || synced == null) {
              _showMyDialog(itemkey, synced);

              //show dialog
              /*showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: Text('Sync Data'),
                        insetAnimationDuration: Duration(milliseconds: 1000),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              //Text('Fetch Data.'),
                              Text('Syncing is required the first time to fetch data',style: TextStyle(fontFamily: 'Raleway-regular',fontWeight: FontWeight.bold,fontSize: 16),),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20,right: 20),
                            child: RaisedButton(
                              color: Colors.green,
                              child: Text('Sync',style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                getContent(synced,snapshot);

                                //Getting Content Start



                                //Getting Content End

                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20,right: 20),
                            child: RaisedButton(
                              color: Colors.orange,
                              child: Text('Not now',style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );*/
              //show Dialog End

            } else if (synced == 1) {
              if (itemkey == "3") {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) => ContentPage(
                //           id: id,
                //           name: name,
                //           image: img,
                //           itemkey: itemkey,
                //         )));
              } else if (itemkey == "4") {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) => HivContent(
                //           id: id,
                //           name: name,
                //           image: img,
                //           itemkey: itemkey,
                //         )));
              } else if (itemkey == "5") {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) => SafetyContent(
                //           id: id,
                //           name: name,
                //           image: img,
                //           itemkey: itemkey,
                //         )));
              } else if (itemkey == "6") {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) => DrugsContent(
                //           id: id,
                //           name: name,
                //           image: img,
                //           itemkey: itemkey,
                //         )));
              } else if (itemkey == "7") {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) => MentalContent(
                //           id: id,
                //           name: name,
                //           image: img,
                //           itemkey: itemkey,
                //         )));
              } else if (itemkey == "8") {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) => HealthContent(
                //           id: id,
                //           name: name,
                //           image: img,
                //           itemkey: itemkey,
                //         )));
              } else if (itemkey == "9") {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) => OthersContent(
                //           id: id,
                //           name: name,
                //           image: img,
                //           itemkey: itemkey,
                //         )));
              }
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 5, left: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 150,
                width: 140,
                color: Colors.grey[300],
                child: Stack(
                  children: <Widget>[
                    /*Image.network(
                    img,
                    fit: BoxFit.cover,
                    width: 140,
                    height: 170,
                  ),*/

                    CachedNetworkImage(
                        imageUrl: img,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.colorBurn,
                              ),
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: circularProgress()),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.error,
                            size: 40,
                          ),
                        )),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black45, Colors.brown],
                                begin: FractionalOffset(0, 0),
                                end: FractionalOffset(0, 1),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Wrap(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 5, top: 2),
                                  child: Text(
                                    name,
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }));
}

  Future<void> _showMyDialog(String itemKey, synced) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Sync Data'),
          insetAnimationDuration: Duration(milliseconds: 1000),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                //Text('Fetch Data.'),
                Text(
                  'Syncing is required the first time to fetch data',
                  style: TextStyle(
                      fontFamily: 'Raleway-regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: RaisedButton(
                color: Colors.green,
                child: Text(
                  'Sync',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // getContent(
                  //   synced,
                  // );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:ElevatedButton(
                child: Text(
                  'Not now',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
  }

