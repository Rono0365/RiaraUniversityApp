//import 'dart:html';

import 'package:flutter/material.dart';

class payM extends StatelessWidget {
  const payM({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed:(){},icon: Icon(Icons.arrow_back_ios,color: Colors.purple),),
        title: Text("Payments",style:TextStyle(color: Colors.purple)),
        elevation: 0.0,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(children:[ SizedBox(width: 10,),Text("You are about to pay "+'\n'+"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal))]),
            Row(children:[ SizedBox(width: 10,),Text("KES",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold))]),
           
            Row(children: [
              SizedBox(width: 10,),
             // Text(,style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
              Text("2000.00"+'\n'+"",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
            ],),
            Card
            (
              elevation: 0.0,
              
              shadowColor: Colors.purple,
              child: Column(

                children:[ ListTile(
                  title: Text("Type Your MPESA pin"),
                ),
                TextField(

                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                
                SizedBox(height: MediaQuery.of(context).size.height*0.05,
                child:Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(onPressed: (){},color: Colors.green, child: Center(child: Text("ok"))),
                  SizedBox(width: MediaQuery.of(context).size.height*0.05,
                ),
                      FlatButton(onPressed: (){},color: Colors.red, child: Center(child: Text("cancel")))
                    ],
                  ),
                )
                )
                ]
              ),
            ),
            Container(height:MediaQuery.of(context).size.height*0.3),
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
                      'Pay',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
            ),
                  
          ],
        ),
      ),
      
    );
  }
}