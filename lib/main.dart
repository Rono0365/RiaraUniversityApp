import 'package:flutter/material.dart';
import 'rutimetable.dart';
import 'ruchat.dart';
import 'dart:ui';
import 'ruprofile.dart';
import 'splash.dart';
import 'dart:convert';
//import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart ' as http;
import 'ruconversation.dart';
import 'package:avatar_glow/avatar_glow.dart';
//import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'chippage.dart';
import 'logcred.dart';
import 'package:intl/intl.dart';
import 'dart:io';

//import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riara University',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: screen(), //B//,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {Key? key,
      required this.title,
      required this.token,
      required this.userid})
      : super(key: key);

  final String title;
  final String token;
  final String userid;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final _MyBook _book;
  var value;
  var week_area;
  var leo;
  var courseblock;
  var title;
  var firstname;
  var lastname;
  var id;
  var unit_name;
  var location;
  var duration;
  var topic;
  var day_taught;
  var time_taught;
  var assignment;
  var assignment_till;
  var valid_till;
  var first_name;
  var last_name;
  var school;
  var id_no;

  var course;
  //var valid_till;
  var now;
  Future getWeather() async {
    String token = widget.token.toString();
    print(token);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    final responsex = await http
        .get(Uri.parse('http://192.168.100.20:8000/id/1'), headers: headers);
    final responsev =
        await http.get(Uri.parse('http://192.168.100.20:8000/posts/'),
            // Send authorization headers to the backend.
            headers: headers);
    //http.Response responsex = await http
    //  .get(Uri.parse('http://192.168.100.20:8000/id/1/')); //get via token
    http.Response response1 = await http.get(
        Uri.parse('http://192.168.100.20:8000/units/'),
        headers: headers); //get via token

    //var result5 = jsonDecode(responsev.body);
    var result1 = jsonDecode(response1.body); //returns json body from api
    var results = jsonDecode(responsev.body); //returns json body from api
    var resultx = jsonDecode(responsex.body);
    setState(() {
      //DateFormat('EEEE').format(date);
      this.week_area = DateFormat(' d MMM').format(DateTime.now());
      this.leo = DateFormat('EEEE').format(DateTime.now());
      this.now = DateFormat('EEEE d MMM')
          .format(DateTime.now()); //returns json body from api

      this.courseblock = result1;
    });
    setState(() {
      this.first_name = resultx['first_name'];

      this.last_name = resultx['last_name'];
      this.school = resultx['School'];
      this.id_no = resultx['id_no'];
      this.course = resultx['Course'];
      this.valid_till = resultx['valid_till'];
    });

    setState(() {
      this.value = results;

     
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  bool noticeboard = false;
  List units = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];
  List<IconData> listicon = [
    Icons.grade_outlined,
    Icons.account_balance,
    Icons.call,
    Icons.group,
    Icons.question_answer,
    Icons.exit_to_app
  ];
  List infochips = [
    ["class", ""],
    ["Cafeteria", ""],
    ["Rusa", ""],
    ["events", ""],
    ["sports", ""],
    ["clubs", ""],
    ["Library", ""],
    ["messages", ""],
    ["lost&found", ""],
  ];

  void rono2() {
    showDialog(
        //student id card here
        context: context,
        builder: (context) {
          /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
          return AlertDialog(
              title: Container(
                height: MediaQuery.of(context).size.width * 0.08,
                color: Colors.purple,
                width: double.infinity,
                child: Text(
                  "Student",
                  style: TextStyle(
                      backgroundColor: Colors.deepPurple,
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ),
              content: Container(
                  height: 320.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: CircleAvatar(
                            child: Icon(Icons.person),
                            radius: MediaQuery.of(context).size.height * 0.15,
                          ),
                        ),
                        Text(
                            first_name.toString() + '\t' + last_name.toString(),
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold, fontSize: 26)),
                        Text(
                          school.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.deepPurple),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ID No.",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(id_no.toString()),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Course.",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(course.toString()),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Valid Until.",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(valid_till.toString()),
                            SizedBox(
                              width: 75,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                      ]))));
        });
  }

  bool seeall = false;
  //DateTime now = new DateTime.now();
  //DateTime now = new DateTime(now.year, now.month, now.day);
  List drawer = [
    'Grades',
    'fees',
    'contact us',
    'lecturers',
    'Get help',
    'Log out',
  ];
  List learntable = [
    [
      "EnvironMental Sustainability",
      "2hr45min",
      "Week9",
      "Topic",
      "G13-physical",
      "8:00AM"
    ],
    [
      "EnvironMental Sustainability",
      "2hr45min",
      "Week9",
      "Title",
      "G13-physical",
      "8:00AM"
    ],
    [
      "EnvironMental Sustainability",
      "2hr45min",
      "Week9",
      "Title",
      "G13-physical",
      "8:00AM"
    ],
  ];

  bool cafeteria = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //: true,
      drawer: Drawer(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person),
                ),
              )
            ],
          ),
        ), // here the desired height(child: AppBar()),
        body: Column(children: [
          Container(
            //height: MediaQuery.of(context).size.height*0.3,
            child: Text(first_name.toString() + '\t' + last_name.toString(),
                style: GoogleFonts.lato(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900)),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: listicon.length,
              itemBuilder: (context, index) {
                var iconz = drawer[index];
                var datex = listicon[index];
                return ListTile(
                  leading: Icon(
                    datex,
                    color: Colors.deepPurple,
                  ),
                  title: Text(iconz),
                  onTap: () {},
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.38,
          ),
          Text("© 2021"),
          Text("Riara University",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold, color: Colors.deepPurple)),
          //Text("#rono was here"),
        ]),
      )),

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        //leading: IconButton(onPressed: () {}, icon:Icon(Icons.menu,color: Colors.black,)),
        title: InkWell(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 28,
                width: 28,
                child: Image.asset('assets/riara00.jpeg'),
              ),
              Text(
                "Mobile",
                style: GoogleFonts.pacifico(
                  color: Colors.black,
                ),
              )
            ]),
            onTap: () async {
              getWeather();
              //print("Show items of Riara");
              //var rr = 'http://192.168.100.20:5000/sysL';
              //http.Response response = await http.get(rr);

              //     http.Response response = await http
              //       .get( "https://en.wikipedia.org/wiki/Riara_University#Sports");

              //http.get('');
            }),
        actions: [
          InkWell(
            child: Chip(
              padding: EdgeInsets.all(5.0),
              avatar: CircleAvatar(
                radius: 27,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 19,
                ),
              ),
              label: Text(
                "ID",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.purple[900]),
              ),
              backgroundColor: Colors.grey[50],
            ),
            onTap: () {
              getWeather();
              rono2();
              print('pressed on id');
            },
          ),
          SizedBox(
            width: 5.0,
          )
        ],
      ),
      body: 
      
      noticeboard != true
          ? courseblock != null && widget.userid != null
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    ListTile(
                      leading: Text("Courses",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                          )),
                      trailing: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.deepPurple,
                          child: Center(
                              child:
                                  Text(courseblock.toList().length.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )))),
                    ),
                    /*Expanded(
                  child: ListView.builder(
                    itemCount: this._book.length,
                    itemBuilder: (ctx,i) => _bookToListTile(_book[i]),
                  ),
                ), */
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(spacing: 10.0, children: [
                        ...courseblock.toList().map(
                              (i) => InkWell(
                                child: Container(
                                  
                                  height:
                                      MediaQuery.of(context).size.width * 0.45,
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Material(
                                      color: Colors.deepPurple.shade50
                                          .withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Card(
                                        elevation: 0.0,
                                        color: Colors.grey.shade200
                                            .withOpacity(0.5),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(i['unit_name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              trailing: Column(children: [
                                                Text(week_area != null
                                                    ? week_area.toString()
                                                    : "week"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor:
                                                      Colors.deepPurple,
                                                  child: Center(
                                                      child: Text(
                                                    "3",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ]),
                                              subtitle: Text("Assignment:"),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ListTile(
                                              //title:Text("Random_not assignment"),
                                              subtitle: Row(children: [
                                                Text("submitted"),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor: Colors.red,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 15,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                              title: i['assignment'] != ""
                                                  ? Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 7,
                                                          backgroundColor:
                                                              Colors.green,
                                                          child: Center(),
                                                        ),
                                                        Text(
                                                            i['assignment']
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                            ))
                                                      ],
                                                    )
                                                  : Text("No assignment",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                      )),
                                            ),
                                          ],
                                        ),
                                      )),
                                      
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Chatscreen(
                                              titlex: i['unit_name'],
                                              title: i,
                                            ) //screen(),
                                        ), //MaterialPageRoute
                                  );
                                },
                              ),
                            )
                      ]),
                    ),
                    ListTile(
                      leading: Text("Noticeboard",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                          )),
                      trailing: InkWell(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.deepPurple,
                                child: Center(
                                    child: RotatedBox(
                                        quarterTurns: 90,
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 12,
                                          color: Colors.white,
                                        )))),
                            Positioned(
                                top: -5,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 6,
                                ))
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            noticeboard = true;
                            getWeather();
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("Today's Timeline",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: now != null
                          ? Text(now, style: TextStyle(color: Colors.grey[900]))
                          : Text("Today"),
                    ),
                    Container(
                      
                      padding: EdgeInsets.all(10.0),
                      child: Expanded(
                        child:

                            //Row with the assignments hii ya down
                            //SizedBox(height: 25),

                            Wrap(
                          //holla
                          spacing: 10.0,
                          //crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 10.0,
                          // scrollDirection: Axis.horizontal, //MediaQuery.of(context).size.width;
                          children: [
                            ...courseblock.toList().map(
                                  (i) => i['day_taught'].toString() ==
                                          leo.toString()
                                      ? InkWell(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.38,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.95,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.deepPurple,
                                                  spreadRadius: 0,
                                                  blurRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
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
                                                            i['duration'])),
                                                    Positioned(
                                                      bottom: 8,
                                                      right: 10,
                                                      child: Chip(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        avatar: CircleAvatar(
                                                          radius: 27,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            color: Colors.red,
                                                            size: 19,
                                                          ),
                                                        ),
                                                        label: Text(
                                                          i['location'],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .grey[900]),
                                                        ),
                                                        backgroundColor:
                                                            Colors.grey[50],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 8,
                                                      left: 10,
                                                      child: Chip(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        avatar: CircleAvatar(
                                                          radius: 27,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Icon(
                                                            Icons.book_outlined,
                                                            color: Colors
                                                                .deepPurple,
                                                            size: 19,
                                                          ),
                                                        ),
                                                        label: Text(
                                                          i['unit_name'],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .grey[900]),
                                                        ),
                                                        backgroundColor:
                                                            Colors.grey[50],
                                                      ),
                                                    ),
                                                    Positioned(
                                                        bottom: 43,
                                                        left: 39,
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.45,
                                                          child: i['assignment'] !=
                                                                  ""
                                                              ? Text(
                                                                  i['assignment'],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          900],
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                )
                                                              : Text(
                                                                  "No assignment"),
                                                        )),
                                                    Positioned(
                                                        top: -10,
                                                        left: 20,
                                                        child: Container(
                                                          height: 135,
                                                          width: 150,
                                                          child: Center(
                                                              child: Text(
                                                            leo.toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          )),
                                                        )),
                                                  ]),
                                            ),
                                          ),
                                          onTap: () async {
                                            //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                                          },
                                        )
                                      : SizedBox(),
                                ),
                          ],
                        ),
                      ),

                      //Expanded(child: Text("NoticeBoard"),)
                    ),
                    ListTile(
                      title: Text("Upcoming :",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Assignments"),
                    ),
                    Wrap(
                      //spacing: 10.0,
                          //crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 10.0,
                      children:[
                    ...courseblock.toList().map((i) => i['assignment'] != ''
                        ? InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.38,
                              width: MediaQuery.of(context).size.width * 0.95,
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
                                    color: Colors.deepPurple,
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
                                        bottom: 8,
                                        right: 10,
                                        child: Chip(
                                          padding: EdgeInsets.all(5.0),
                                          avatar: CircleAvatar(
                                            radius: 27,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.timer_outlined,
                                              color: Colors.red,
                                              size: 19,
                                            ),
                                          ),
                                          label: Text(
                                            i['assignment_till'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[900]),
                                          ),
                                          backgroundColor: Colors.grey[50],
                                        ),
                                      ),
                                      Positioned(
                                        top: 7,
                                        right: 10,
                                        child: Chip(
                                          padding: EdgeInsets.all(5.0),
                                          label: Icon(
                                            Icons.notifications_active,
                                            color: Colors.red,
                                            size: 19,
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
                                              Icons.book_outlined,
                                              color: Colors.deepPurple,
                                              size: 19,
                                            ),
                                          ),
                                          label: Text(
                                            i['unit_name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[900]),
                                          ),
                                          backgroundColor: Colors.grey[50],
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 63,
                                          left: 39,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: Text(
                                              i['assignment'],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.grey[900],
                                                  fontWeight: FontWeight.bold),
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
                                              "", //leo.toString(),
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          )),
                                    ]),
                              ),
                            ),
                            onTap: () async {
                              //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                            },
                          )
                        : SizedBox()),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.20),
                  ]),
                ]))
              : Center(
                  child: CircularProgressIndicator(),
                )
          : Scaffold(
              //itshere
              body: value == null
                  ? Center(
                      child: Text("You're offline"),
                    )
                  : ListView.builder(
                      itemCount: value.toList().length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          InkWell(
                              child: Card(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white, width: 0.5),
                                    borderRadius: BorderRadius.circular(0)),
                                child: Column(children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 15,
                                      child: Icon(Icons.person),
                                    ),
                                    title: value[index]['firstname'] != "" &&
                                            value[index]['lastname'] != ""
                                        ? Text(
                                            value[index]['firstname']
                                                    .toString() +
                                                '\t' +
                                                value[index]['lastname']
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade900))
                                        : Text("admin",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade900)),
                                    trailing: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                height: 300,
                                                child: Column(children: [
                                                  ListTile(
                                                      leading: Icon(Icons.flag),
                                                      title: Text("Report",
                                                          style: GoogleFonts.lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  ListTile(
                                                      leading: Icon(
                                                          Icons.thumb_down),
                                                      title: Text(
                                                          "Inappropriate",
                                                          style: GoogleFonts.lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  ListTile(
                                                      leading: Icon(Icons
                                                          .thumb_up_alt_outlined),
                                                      title: Text(
                                                          "Cool/Awesome",
                                                          style: GoogleFonts.lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                ]),
                                              );
                                            });
                                      },
                                      icon: Icon(Icons.more_vert),
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                  ListTile(
                                    subtitle: Text(
                                        value[index]['body'].toString(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors
                                                .black)), //,style: GoogleFonts.quicksand(color: Colors.grey.shade900,fontSize: 17)),
                                  ),
                                  value[index]['poster'] != ""
                                      ? Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: Colors.grey.shade300,
                                              // red as border color
                                            ),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          // color: Colors.grey,
                                        )
                                      : Container(),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(),
                                        Container(
                                          child: Chip(
                                            avatar: Icon(Icons.person,
                                                color: Colors.transparent),
                                            label: Text("5",
                                                style: TextStyle(
                                                    color: Colors.transparent)),
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ),
                                      ])
                                ]),
                              ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            value[index]['title'].toString())));
                              }),
                        ]);
                        Expanded(child: Text(value[index]['body'].toString()));
                      }))
    ,
              

                      
                      
    //SizedBox(height: MediaQuery.of(context).size.width * 0.035),

  bottomNavigationBar: Padding(
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
                InkWell(
                  child: Chip(
                    padding: EdgeInsets.all(5.0),
                    avatar: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/riara00.jpeg') //hapX
                        ),
                    label: Text(
                      "Dashboard",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900]),
                    ),
                    backgroundColor: Colors.grey[50],
                  ),
                  onTap: () {
                    //rono2();
                  },
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Rutimetable(title1: courseblock, title2: units),
                      ),
                    );
                  },
                  icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22,
                      child: Icon(Icons.calendar_today)),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ruchat(title1: courseblock, title: units),
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
                          builder: (context) =>
                              ruprofile(), //title1:this.title1.toString(),title: this.title2.toString(),
                        ),
                      );
                      //
                    },
                    icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22,
                            child: Icon(Icons.person)))),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: noticeboard
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  noticeboard = false;
                });
              },
              child: Icon(Icons.close))
          : Container()); // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}
