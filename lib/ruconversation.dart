import 'dart:convert';

import 'main.dart';
//import 'Netcloud.dart';
import "package:flutter/material.dart";
//import 'vidfeed.dart';
import 'package:http/http.dart' as http;
//import 'coolslides.dart';
import 'dart:io';
import 'package:date_format/date_format.dart';
//import 'package:web_scraper/web_scraper.dart';
//import 'viddata.dart';
//import 'JudeDashboard.dart';
//import 'package:badges/badges.dart';
import 'dart:ui';
import 'dart:core';
//import 'package:flutter_tts/flutter_tts.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Chatscreen extends StatefulWidget {
  Chatscreen({Key? key, required this.titlex, required this.title})
      : super(key: key);
  final titlex;
  final title;
  //hello(titlex);

  @override
  _ChatscreenState createState() =>
      _ChatscreenState(title: title, titlex: titlex);
}

class _ChatscreenState extends State<Chatscreen> {
  _ChatscreenState({Key? key, required this.titlex, required this.title});

  final titlex;
  final title;
  bool assignment = false;
  var hey;
  bool isMe = false;
  String now = formatDate(DateTime.now(), [HH, ':', nn]);
  String url = '';
  String Data = "ok";
  //hapa
  void hello(String c) {
    print("hello");
  }

  void hellox(String c) {
    final hey = c;
  }

  String QueryText = ''; //hapa
  final _formkey = GlobalKey<FormState>();
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  var value;
  String text = "what can you do?";
  //ScrollController _controller;
  //FlutterTts flutterTts = FlutterTts();

  //await flutterTts.awaitSpeakCompletion(true);

  final TextEditingController eCtrl = new TextEditingController();
  void _setText() {
    setState(() {
      text = titleController.text;
    });
  }

//clear the data in the textfield
  void clearText() {
    titleController.clear();
  }

  List<String> litems = []; //here
  List<String> litems2 = [];

  // final String name;
  bool _isPaused = false;
  //final response = http.get('http://112ce0ac817f.ngrok.io/api?Query=Text');
  final titleController = TextEditingController();
  final scrollDirection = Axis.vertical;
  final ScrollController _scrollController = ScrollController();
  var judeT = DateTime.now();
  //myImageAnd caption list should ne a random change list derived from the jude api
  final myImageAndCaptionX = [
    ["images/keja.png", "Raise Hand"],
    ["images/sun.png", "Question?"],

    //["images/book.png", ""],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: assignment?true:false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0.0,
          //brightness: Brightness.light,

          centerTitle: true,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  //spreadRadius: 5,
                  blurRadius: 2,
                )
              ],
            ),
            margin: EdgeInsets.all(20.0),
            child: Column(
              //height:80,
              children: <Widget>[
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Stack(
                      children: [
                        Positioned(
                            child: Text(
                          widget.titlex,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            this.title['assignment'] != ""
                ? !assignment? Container(
                    color: Colors.grey.shade900,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.13,
                    child: Center(
                        child: Text(this.title['assignment'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ))),
                  ):SizedBox()
                : SizedBox(),

            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                //controller:

                //reverse: true,

                padding: EdgeInsets.all(30),
                controller: _scrollController,

                scrollDirection: scrollDirection,

                itemCount: litems.length,

                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      //ni hapa jamaa

                      InkWell(
                        child: Container(
                            alignment: Alignment.topRight,
                            child: Stack(overflow: Overflow.visible, children: [
                              Container(
                                //alignment: Alignment.topRight,
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.60,
                                ),
                                padding: EdgeInsets.all(13),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: litems[index].toString() ==
                                            litems[litems.length - 1]
                                        ? Radius.circular(20.0)
                                        : Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purple,
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                    )
                                  ],
                                ),
                                child: Text(
                                  litems[index].toString(),
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Positioned(
                                bottom: -35,
                                right: -20,
                                child: litems[index].toString() ==
                                        litems[litems.length - 1]
                                    ? Row(children: [
                                        Chip(
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
                                            "You",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.purple[900]),
                                          ),
                                          backgroundColor: Colors.grey[50],
                                        ),
                                        Text(
                                          "|",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Text(now)
                                      ])
                                    : Container(
                                        child: null,
                                      ),
                              ),
                            ])),
                        onTap: () async {
                          /*  var Data = await GetData(
                              'http://192.168.100.20:5000/api?Query=' +
                                  litems[Index]);*/
                        },
                      ),
                      /* litems2[Index] == "ok"
                          ? Container(
                              color: Colors.transparent,
                            )
                          : Container(
                              alignment: Alignment.topLeft,
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green,
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                    )
                                  ],
                                ),
                                //final webScraper = WebScraper('https://webscraper.io');
                                //if(await webScraper.loadWebPage('/test-sites/e-commerce/allinone')){
                                //  List<Map<String, dynamic>> elements = webScraper.getElement('h3.title > a.caption', ['href']);
                                //print(elements);
                                //}
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: <Widget>[
                                    Positioned(
                                        //  left:0,
                                        child: litems2[Index] == "ok"
                                            ? Container(
                                                color: Colors.transparent)
                                            : Text(
                                                litems2[Index],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.green[500]),
                                              )),
                                  ],
                                ),
                              ),
                            ),*/
                    ],
                  );
                },
              ),
            ),

            //ni hapa

            //     Widget _editTitleTextField() {if (_isEditingText)    return Center(      child: TextField(        onSubmitted: (newValue){          setState(() {            initialText = newValue;            _isEditingText =false;          });        },        autofocus: true,        controller: _editingController,      ),    );  return InkWell(    onTap: () {      setState(() {        _isEditingText = true;      });    },    child: Text(  initialText,  style: TextStyle(    color: Colors.black,    fontSize: 18.0,  ), );}
            //This is just a step to an old story.
            Theme(
              data: Theme.of(context).copyWith(
                cardColor: Colors.transparent,
              ),
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 900.0,
                        color: Colors.transparent,
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            /*Positioned(
                              // top: 10,

                              child: ListView(
                                
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: [
                                  ...myImageAndCaptionX.map(
                                    (i) => Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                            child: Chip(
                                              avatar: CircleAvatar(
                                                  // radius: 27,
                                                  backgroundColor:
                                                      Colors.grey[50],
                                                  child: Icon(
                                                    Icons.pan_tool_outlined ,
                                                    size: 15,
                                                  )),
                                              label: Text(
                                                i.last,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onTap: () async {
                                              litems.add(i.last.toString());
                                              _scrollController.animateTo(
                                                  _scrollController
                                                      .position.maxScrollExtent,
                                                  duration: Duration(
                                                      milliseconds: 60),
                                                  curve: Curves.fastOutSlowIn);
                                                                                               _scrollController.animateTo(
                                                  _scrollController
                                                      .position.maxScrollExtent,
                                                  duration: Duration(
                                                      milliseconds: 60),
                                                  curve: Curves.fastOutSlowIn);
                                                                                               _scrollController.animateTo(
                                                  _scrollController
                                                      .position.maxScrollExtent,
                                                  duration: Duration(
                                                      milliseconds: 60),
                                                  curve: Curves.fastOutSlowIn);
                                                   _scrollController.animateTo(
                                                  _scrollController
                                                      .position.maxScrollExtent,
                                                  duration: Duration(
                                                      milliseconds: 60),
                                                  curve: Curves.fastOutSlowIn);
                                              /*final response = await http.get(
                                                  );
                                              if (response.statusCode == 200) {
                                                Data = await GetData(
                                                    'http://192.168.100.20:5000/api?Query=' +
                                                        i.last.toString());
                                                litems2.add(json.decode(Data));
                                                // Append Text to the list
                                                //ItemScrollController _scrollController = ItemScrollController();
                                                //       _scrollController.jumpTo(pos);

                                                // Clear the Text area
                                                setState(() {});
                                                clearText();

                                                sleep(const Duration(
                                                    milliseconds: 500));

                                                final decoded =
                                                    json.decode(response.body)
                                                        as Map<String, dynamic>;
                                                return litems2;
                                              } else {
                                                litems.add(i.last.toString());
                                                litems2.add(
                                                    "Am offline at the moment");
                                                _scrollController.animateTo(
                                                    _scrollController.position
                                                        .maxScrollExtent,
                                                    duration: Duration(
                                                        milliseconds: 60),
                                                    curve:
                                                        Curves.fastOutSlowIn);
                                                clearText();

                                                sleep(const Duration(
                                                    milliseconds: 500));
                                              }
                                              ;*/
                                            })
                                        /* onTap: () async {
                                //roro(["hello" "there"]);
                                print(["hello", "there"]);
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => coolP()),
                                );
                                var Data = await GetData(
                                'http://192.168.100.20:5000/api?Query=' + i.last,
                                );*/

                                        ,
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),*/

                            /*InkWell(
                                                  child: Chip(
                                                    avatar: CircleAvatar(
                                                      // radius: 27,
                                                      //backgroundColor: Colors.purple,
                                                      child: Icon(Icons.add),
                                                    ),
                                                    label: Text(
                                                      "lights on",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {

                                                  },
                                                ),*/
                          ],
                        ),
                      ),
                      Row(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.81,
                          child: Expanded(
                            child: TextField(
                              onChanged: (value) {
                                enabled:
                                false;
                                setState(() {
                                  assignment = true;
                                });
                              },

                              //void man => value.toString();

                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blueGrey[50],
                                  hintText: 'tap and write',
                                  hintStyle: TextStyle(color: Colors.grey[900]),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0))),
                              controller: titleController
                              
                              ,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        GestureDetector(
                          // Redraw the Stateful Widget

                          onTap: () async {
                            //rono.ai was here
                            print("am pressed");
                            if (titleController.text.length > 0) {
                              setState(() {
                                now = formatDate(DateTime.now(), [HH, ':', nn]);
                                litems.add(titleController.text.toString());
                                _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 60),
                                    curve: Curves.fastOutSlowIn);
                                titleController.clear();
                              });
                            }
                          },

                          child: CircleAvatar(
                            radius: 26,
                            child: Icon(Icons.send),
                          ),
                          onLongPress: () {},
                        ),
                      ]),
                    ]),
              ),

              //here
            ),
          ],
        ));
    //void man() => value.toString();
  }
}
