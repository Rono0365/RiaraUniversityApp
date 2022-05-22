import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'netcloud.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'payments.dart';

class reg2 extends StatefulWidget {
  const reg2({Key? key}) : super(key: key);

  @override
  _reg2State createState() => _reg2State();
}

class _reg2State extends State<reg2> {
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();
  final titleController4 = TextEditingController();
  final titleControllerv = TextEditingController();

  var passtok;
  var fh;

  var userid;
  var userid1;
  var userid2;
  var userid3;
  var items = [
    'School Of Computing Sciences',
    'School Of Business',
    'School of Law'
  ];
  var items3 = [
    'Degree',
    'Diploma',
    'Certificate',

    //'School of Law'
  ];
  var items2 = [
    'Full-time',
    'Part-time',
    //'School of Law'
  ];
  Future createAlbum() async {
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.20:8000/api-token-auth/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': titleController.text,
        'password': titleController1.text,
      }),
    );

    //works => print(token['token']);

    var token = jsonDecode(response1.body);

    setState(() {
      passtok = token['token'].toString();
      userid = token['user_id'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("Register",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: titleControllerv,
                  decoration: InputDecoration(
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        titleControllerv.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items.map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'School',

                    //hintText: 'Enter Your first name'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: titleController3,
                  decoration: InputDecoration(
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        titleController3.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items3
                            .map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Programme',

                    //hintText: 'Enter Your first name'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        titleController.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items2
                            .map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Shift',
                    //hintText: 'Enter Your Second name'
                  ),
                ),
              ),
              FlatButton(
                child: const Text('Drop your academic documents'),
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles();

                  List<String>? files = result?.files
                      .map((file) => file.path)
                      .cast<String>()
                      .toList();

                  if (files == null) {
                    return;
                  }
                  setState(() {
                    fh = files;
                  });

                  //await Share.shareFiles(files);
                },
              ),
              FlatButton(
                  onPressed: () {
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: fh != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Icon(Icons.done_outline),
                              Text("received the credentials")
                            ])
                      : Container()),
              fh != null
                  ? ListTile(
                      title: Text("KES 2000 for Admission"),
                      trailing: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => payM()));
                          },
                          child: Chip(label: Text("Pay"))),
                    )
                  : Container(),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    //createAlbum();
                    /*setState(() {
                    passtok != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                title: "Riara Mobile",
                                token: passtok,
                                userid: userid,
                              ),
                            ))
                        : Container(
                            child:
                                Center(child: Text("revisit your credentials")),
                          );
                  });*/
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Text('© 2021' + '\n' + 'Riara University',
                  textAlign: TextAlign.center)
            ],
          ),
        ));
  }
}
