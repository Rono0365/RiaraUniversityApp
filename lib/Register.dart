import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'netcloud.dart';
import 'reg2.dart';
import 'package:flutter/material.dart';
class regS extends StatefulWidget {
  const regS({ Key? key }) : super(key: key);

  @override
  _regSState createState() => _regSState();
}

class _regSState extends State<regS> {
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();
  final titleController4 = TextEditingController();
  final titleControllerv = TextEditingController();
  
  var passtok;
  var userid;
  var userid1;
  var userid2;
  var userid3;

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
        title: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
        
      ),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,

            )
,            
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: titleControllerv,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'First name',
                    hintText: 'Enter Your first name'),
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
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Second name',
                    hintText: 'Enter Your Second name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: titleController1,
                //obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),

                    //border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: titleController2,
                //obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),

                    //border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number +254...'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: titleController3,
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: titleController4,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),

                    //border: OutlineInputBorder(),
                    labelText: 'Re-enter Password',
                    hintText: 'Enter secure pasword'),
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
                  if (titleController.text != "" && titleController1.text != ""){
                     Navigator.push(
                    context, MaterialPageRoute(builder: (context) => reg2()));
              
                  }
                  
                  
                },
                child: Text(
                  'Continue',
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
      )
      
    );
  }
}