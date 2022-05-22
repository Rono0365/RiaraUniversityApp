import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'rutimetable.dart';
import 'ruprofile.dart';
import 'ruconversation.dart';


class ruchat extends StatelessWidget {
  const ruchat({Key? key,required this.title,required this.title1}) : super(key: key);
  final List title;
  final  title1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(onPressed: (){ Navigator.pop(context, true); }, icon:Icon(Icons.arrow_back_ios,color: Colors.black,)),
         
        title: Text("Classgroups",style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color:Colors.black)),
           
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...this.title1.map((i) =>ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.deepPurple[50],
                child: Icon(
                  Icons.book_outlined,
                  color: Colors.purple,
                ),
              ),
              trailing: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.deepPurple,
                child: Center(
                  child: Text("3",style:TextStyle(color: Colors.white))
                ),
              ),
              title: Text(
                i['unit_name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Message'),
              onTap: () {
                 Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chatscreen (titlex: i['unit_name'],title: i,),
                ), //MaterialPageRoute
              );
                //navigate
                
               
              },
            ), ),
            
          ],
        ),
      ),
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
                        child: Icon(Icons.home))),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Rutimetable(title1:this.title1,title2: this.title1),
                        ),
                      );
                    },
                    icon:CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: Icon(Icons.calendar_today))),
                InkWell(
                  child: Chip(
                    padding: EdgeInsets.all(5.0),
                    avatar: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.message_outlined,
                        color: Colors.purple[900],
                        size: 19,
                      ),
                    ),
                    label: Text(
                      "groups",
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
                            builder: (context) => ruprofile(),//title1:this.title1.toString(),title: this.title2.toString(),
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
    );
  }
}
