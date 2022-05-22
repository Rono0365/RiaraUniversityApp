import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'netcloud.dart';
import 'package:flutter/material.dart';
import 'Register.dart';
//import 'HomePage.dart';

class MyAppL extends StatefulWidget {
  @override
  _MyAppLState createState() => _MyAppLState();
}

class _MyAppLState extends State<MyAppL> {
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  var passtok;
  var userid;
  int State = 200;
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
    print(response1.statusCode);
    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
    });
    var token = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      setState(() {
        passtok = token['token'].toString();
        userid = token['user_id'].toString();
      });

      //});

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        actions: [
          FlatButton(
              onPressed: (() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => regS()));
              }),
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset(
                        'assets/riaralogowhite-removebg-preview.png')),
              ),
            ),
            Text(
              "Nurturing Innovators.",
              style: GoogleFonts.caveat(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Student ID',
                    hintText: 'Enter valid  id as 21ZA*******'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: titleController1,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),

                    //border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            FlatButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    createAlbum();
                  if (State == 200) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(
                            title: "Riara Mobile",
                            token: passtok,
                            userid: userid,
                          ),
                        ));
                  }
                  ;
                  });
                  //print(State);
                  
                },
                child: Text(
                  'Login',
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
      ),
    );
  }
}
