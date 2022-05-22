import 'package:flutter/material.dart';
import 'main.dart';
import 'logcred.dart';

class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  void initState() {
    super.initState();
    _navtohome();
  }

  _navtohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MyAppL()));//MyHomePage(title: "myRiara")
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.width * 0.50,
              width: MediaQuery.of(context).size.width * 0.50,
              child: Image.asset('assets/riaralogowhite-removebg-preview.png')),
        ],
      )),
    );
  }
}
