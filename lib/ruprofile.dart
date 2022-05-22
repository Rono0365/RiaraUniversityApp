import 'package:flutter/material.dart';
import 'ruchat.dart';
import 'rutimetable.dart';
import 'main.dart';

bool profile = true;

class ruprofile extends StatefulWidget {
  const ruprofile({Key? key}) : super(key: key);

  @override
  _ruprofileState createState() => _ruprofileState();
}

class _ruprofileState extends State<ruprofile> {
  @override
  Widget build(BuildContext context) {
    List<IconData> listicon = [
    Icons.grade_outlined,
    Icons.account_balance,
    Icons.call,
    Icons.group,
    Icons.question_answer,
    Icons.exit_to_app
  ];
     List drawer = [
    'Grades',
    'fees',
    'contact us',
    'lecturers',
    'Get help',
    'Log out',
  ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(onPressed: (){ Navigator.pop(context, true); }, icon:Icon(Icons.arrow_back_ios,color: Colors.black,)),
         
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 140.0 / 2,
                      child: CircleAvatar(
                        child: Icon(Icons.person),
                        radius: 35,
                      ),
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 34.0),
                    ),
                    Text(
                      'SCS/Jan 2021',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.greenAccent),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    //tabview starts now
                  ])),
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
      ]),
     /* bottomNavigationBar: Padding(
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
                        builder: (context) => MyHomePage(title: 'RiaraUni'),
                      ),
                    );*/
                  },
                  icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22,
                      child: Icon(Icons.home)),
                ),
                IconButton(
                  onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Rutimetable(),
                      ),
                    );*/
                  },
                  icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22,
                      child: Icon(Icons.calendar_today)),
                ),
                IconButton(
                    onPressed: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ruchat(),
                        ),
                      );*/
                    },
                    icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: Icon(Icons.message_outlined))),
                InkWell(
                  child: Chip(
                    padding: EdgeInsets.all(5.0),
                    avatar: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.purple[900],
                        size: 19,
                      ),
                    ),
                    label: Text(
                      "Profile",
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
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}
