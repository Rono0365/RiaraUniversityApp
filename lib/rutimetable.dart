import 'package:flutter/material.dart';
import 'main.dart';
import 'ruchat.dart';
import 'ruprofile.dart';

class Rutimetable extends StatelessWidget {
  const Rutimetable({Key? key, required this.title1, required this.title2})
      : super(key: key);
  //final  title;
  final List title1;
  final title2;
  @override
  Widget build(BuildContext context) {
    List timetable = [
      [
        "Monday",
        "Environmental Sustainability",
        ["2hr45min", "Week9", "Topic", "G13-physical"]
      ],
      [
        "Tuesday",
        "Environmental Sustainability",
        ["2hr45min", "Week9", "Topic", "G13-physical"]
      ],
      [
        "Wednesday",
        "Environmental Sustainability",
        ["2hr45min", "Week9", "Topic", "G13-physical"]
      ],
      [
        "Thursday",
        "Environmental Sustainability",
        ["2hr45min", "Week9", "Topic", "G13-physical"]
      ],
      [
        "Friday",
        "Environmental Sustainability",
        ["2hr45min", "Week9", "Topic", "G13-physical"]
      ]
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(onPressed: (){ Navigator.pop(context, true); }, icon:Icon(Icons.arrow_back_ios,color: Colors.black,)),
          title: Row(
            children: [
              Text(
                "Program of Study",
                style: TextStyle(color: Colors.grey[900]),
              ),
            ],
          ),
          actions: [
            //thisX
            PopupMenuButton(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                child: Stack(children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[50],
                    radius: 16,
                    child: Icon(
                      Icons.book_outlined,
                    ),
                  ),
                  Positioned(
                      child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.red,
                  )),
                ]),
              ),
              itemBuilder: (context) => [
                ...this
                    .title1
                    .map(
                      (i) => PopupMenuItem(
                          child: i['assignment'] == ""
                              ? Column(children: [
                                  Row(children: [
                                    Chip(
                                      label: Text(i['unit_name'].toString()),
                                    )
                                  ]),
                                  Row(children: [
                                    Icon(
                                      Icons.notifications,
                                      color: Colors.redAccent,
                                    ),
                                    Text(
                                      "No Assignment",
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ])
                                ])
                              : Column(children: [
                                  Row(children: [
                                    Chip(
                                      label: Text(i['unit_name'].toString()),
                                    )
                                  ]),
                                  Row(children: [
                                    Icon(
                                      Icons.notifications,
                                      color: Colors.green,
                                    ),
                                    Text(i['assignment'].toString())
                                  ])
                                ])),
                    )
                    .toList(),
              ],
            )
          ]),
      body: DefaultTabController(
          length: 5,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 5.0,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 36.0)),
              tabs: [
                ...timetable.map(
                  (i) => Tab(
                    icon: CircleAvatar(
                      radius: 15,
                      child: Text(i[0].substring(0, 2).toString()),
                    ),

                    //  backgroundColor: Colors.grey[50],
                  ),
                ),
              ],
            ),
            body: TabBarView(children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...this.title1.map((i) => i['day_taught'] == "Monday"
                        ? Column(children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 12,
                                    width: 7,
                                    color: Colors.deepPurple,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      i['time_taught'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.92,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepPurple.shade900,
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                    )
                                  ],
                                ),
                                child: Material(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Stack(
                                      overflow: Overflow.visible,
                                      alignment: Alignment.topLeft,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 135,
                                          width: 350,
                                        ),
                                        Positioned(
                                            top: 8,
                                            right: 10,
                                            child:
                                                Text(i['duration'].toString())),
                                        Positioned(
                                          bottom: 8,
                                          right: 10,
                                          child: Chip(
                                            padding: EdgeInsets.all(5.0),
                                            avatar: CircleAvatar(
                                              radius: 27,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.red,
                                                size: 19,
                                              ),
                                            ),
                                            label: Text(
                                              i['location'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[900]),
                                            ),
                                            backgroundColor: Colors.grey[50],
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          left: 10,
                                          child: Chip(
                                            padding: EdgeInsets.all(5.0),
                                            avatar: CircleAvatar(
                                              radius: 27,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.eco_outlined,
                                                color: Colors.greenAccent,
                                                size: 19,
                                              ),
                                            ),
                                            label: Text(
                                              i['unit_name'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[900]),
                                            ),
                                            backgroundColor: Colors.grey[50],
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 43,
                                            left: 39,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: Text(
                                                i['Topic'].toString(),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.grey[900],
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            )),
                                        Positioned(
                                            top: -10,
                                            left: 20,
                                            child: Container(
                                              height: 135,
                                              width: 150,
                                              child: Center(
                                                  child: Text(
                                                ".",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                            )),
                                      ]),
                                ),
                              ),
                              onTap: () async {
                                //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ])
                        : Container())
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...this.title1.map((i) => i['day_taught'] == "Tuesday"
                        ? Column(children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 12,
                                    width: 7,
                                    color: Colors.deepPurple,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      i['time_taught'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.92,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepPurple.shade900,
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                    )
                                  ],
                                ),
                                child: Material(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Stack(
                                      overflow: Overflow.visible,
                                      alignment: Alignment.topLeft,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 135,
                                          width: 350,
                                        ),
                                        Positioned(
                                            top: 8,
                                            right: 10,
                                            child:
                                                Text(i['duration'].toString())),
                                        Positioned(
                                          bottom: 8,
                                          right: 10,
                                          child: Chip(
                                            padding: EdgeInsets.all(5.0),
                                            avatar: CircleAvatar(
                                              radius: 27,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.red,
                                                size: 19,
                                              ),
                                            ),
                                            label: Text(
                                              i['location'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[900]),
                                            ),
                                            backgroundColor: Colors.grey[50],
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          left: 10,
                                          child: Chip(
                                            padding: EdgeInsets.all(5.0),
                                            avatar: CircleAvatar(
                                              radius: 27,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.eco_outlined,
                                                color: Colors.greenAccent,
                                                size: 19,
                                              ),
                                            ),
                                            label: Text(
                                              i['unit_name'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[900]),
                                            ),
                                            backgroundColor: Colors.grey[50],
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 43,
                                            left: 39,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: Text(
                                                i['Topic'].toString(),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.grey[900],
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            )),
                                        Positioned(
                                            top: -10,
                                            left: 20,
                                            child: Container(
                                              height: 135,
                                              width: 150,
                                              child: Center(
                                                  child: Text(
                                                ".",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                            )),
                                      ]),
                                ),
                              ),
                              onTap: () async {
                                //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ])
                        : Container())
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...this.title1.map((i) => i['day_taught'] == "Wednesday"
                        ? Column(children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 12,
                                    width: 7,
                                    color: Colors.deepPurple,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      i['time_taught'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.92,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepPurple.shade900,
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                    )
                                  ],
                                ),
                                child: Material(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Stack(
                                      overflow: Overflow.visible,
                                      alignment: Alignment.topLeft,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 135,
                                          width: 350,
                                        ),
                                        Positioned(
                                            top: 8,
                                            right: 10,
                                            child:
                                                Text(i['duration'].toString())),
                                        Positioned(
                                          bottom: 8,
                                          right: 10,
                                          child: Chip(
                                            padding: EdgeInsets.all(5.0),
                                            avatar: CircleAvatar(
                                              radius: 27,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.red,
                                                size: 19,
                                              ),
                                            ),
                                            label: Text(
                                              i['location'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[900]),
                                            ),
                                            backgroundColor: Colors.grey[50],
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          left: 10,
                                          child: Chip(
                                            padding: EdgeInsets.all(5.0),
                                            avatar: CircleAvatar(
                                              radius: 27,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.eco_outlined,
                                                color: Colors.greenAccent,
                                                size: 19,
                                              ),
                                            ),
                                            label: Text(
                                              i['unit_name'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[900]),
                                            ),
                                            backgroundColor: Colors.grey[50],
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 43,
                                            left: 39,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: Text(
                                                i['Topic'].toString(),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.grey[900],
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            )),
                                        Positioned(
                                            top: -10,
                                            left: 20,
                                            child: Container(
                                              height: 135,
                                              width: 150,
                                              child: Center(
                                                  child: Text(
                                                ".",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                            )),
                                      ]),
                                ),
                              ),
                              onTap: () async {
                                //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ])
                        : Container())
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...this.title1.map((i) => i['day_taught'] == "Thursday"
                          ? Column(children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 12,
                                      width: 7,
                                      color: Colors.deepPurple,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        i['time_taught'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[900]),
                                      ),
                                    ),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.38,
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.deepPurple.shade900,
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Stack(
                                        overflow: Overflow.visible,
                                        alignment: Alignment.topLeft,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 135,
                                            width: 350,
                                          ),
                                          Positioned(
                                              top: 8,
                                              right: 10,
                                              child: Text(
                                                  i['duration'].toString())),
                                          Positioned(
                                            bottom: 8,
                                            right: 10,
                                            child: Chip(
                                              padding: EdgeInsets.all(5.0),
                                              avatar: CircleAvatar(
                                                radius: 27,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.red,
                                                  size: 19,
                                                ),
                                              ),
                                              label: Text(
                                                i['location'].toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[900]),
                                              ),
                                              backgroundColor: Colors.grey[50],
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            left: 10,
                                            child: Chip(
                                              padding: EdgeInsets.all(5.0),
                                              avatar: CircleAvatar(
                                                radius: 27,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.eco_outlined,
                                                  color: Colors.greenAccent,
                                                  size: 19,
                                                ),
                                              ),
                                              label: Text(
                                                i['unit_name'].toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[900]),
                                              ),
                                              backgroundColor: Colors.grey[50],
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 43,
                                              left: 39,
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                child: Text(
                                                  i['Topic'].toString(),
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.grey[900],
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )),
                                          Positioned(
                                              top: -10,
                                              left: 20,
                                              child: Container(
                                                height: 135,
                                                width: 150,
                                                child: Center(
                                                    child: Text(
                                                  ".",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                              )),
                                        ]),
                                  ),
                                ),
                                onTap: () async {
                                  //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ])
                          : Container())
                    ]),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...this.title1.map((i) => i['day_taught'] == "Friday"
                        ? Column(children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 12,
                                    width: 7,
                                    color: Colors.deepPurple,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      i['time_taught'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.92,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepPurple.shade900,
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                    )
                                  ],
                                ),
                                child: Material(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Stack(
                                      overflow: Overflow.visible,
                                      alignment: Alignment.topLeft,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 135,
                                          width: 350,
                                        ),
                                        Positioned(
                                            top: 8,
                                            right: 10,
                                            child:
                                                Text(i['duration'].toString())),
                                        Positioned(
                                          bottom: 8,
                                          right: 10,
                                          child: Chip(
                                            padding: EdgeInsets.all(5.0),
                                            avatar: CircleAvatar(
                                              radius: 27,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.red,
                                                size: 19,
                                              ),
                                            ),
                                            label: Text(
                                              i['location'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[900]),
                                            ),
                                            backgroundColor: Colors.grey[50],
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          left: 10,
                                          child: Chip(
                                            padding: EdgeInsets.all(5.0),
                                            avatar: CircleAvatar(
                                              radius: 27,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.eco_outlined,
                                                color: Colors.greenAccent,
                                                size: 19,
                                              ),
                                            ),
                                            label: Text(
                                              i['unit_name'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[900]),
                                            ),
                                            backgroundColor: Colors.grey[50],
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 43,
                                            left: 39,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: Text(
                                                i['Topic'].toString(),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.grey[900],
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            )),
                                        Positioned(
                                            top: -10,
                                            left: 20,
                                            child: Container(
                                              height: 135,
                                              width: 150,
                                              child: Center(
                                                  child: Text(
                                                ".",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                            )),
                                      ]),
                                ),
                              ),
                              onTap: () async {
                                //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ])
                        : Container())
                  ],
                ),
              ),
            ]),
            /*bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Expanded(
                child: Container(
                  height: 50,
                  width: 100,
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[50],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0),
                        spreadRadius: 0,
                        blurRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyHomePage(title: 'RiaraUni')),
                            );*/
                          },
                          icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 22,
                              child: Icon(Icons.home))),
                      InkWell(
                        child: Chip(
                          padding: EdgeInsets.all(5.0),
                          avatar: CircleAvatar(
                            radius: 27,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.purple[900],
                              size: 19,
                            ),
                          ),
                          label: Text(
                            "time table",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple[900]),
                          ),
                          backgroundColor: Colors.grey[50],
                        ),
                        onTap: () {
                          //rono2();
                          print('pressed on Home Button');
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ruchat(title1: this.title1,title: this.title2,),
                              ),
                            );
                          },
                          icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 22,
                              child: Icon(Icons.message_outlined))),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ruprofile()//title1:this.title1.toString(),title: this.title2.toString(),),
                              ),
                            );
                          },
                          icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 22,
                              child: Icon(Icons.person))),
                    ],
                  ),
                ),
              ),
            ),*/
          )),
    );
  }
}
