
import 'package:flutter/material.dart';
import 'globals.dart';
import 'DB_Calls.dart';
import 'UpdateProfile.dart';

void main() => runApp(new PlaceholderWidget());

class PlaceholderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String tag = 'view-account-page';


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  String username , interest , description ;
  @override
  void initState() {
    build(context);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,

        body:new Stack(

          alignment: Alignment.center,


          children: <Widget>[


            Positioned(



                child: ListView(

                  //shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(height: 60.0),
                    Image.asset(

                      'assets/images/Profile2.png',
                      height: 140,
                      width: 140,

                      //alignment: Alignment.center,


                    ),

                    SizedBox(height: 50.0),

                    Text(
                      '$currentUserName',
                      textAlign: TextAlign.center,
                      style: TextStyle(

                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),

                    SizedBox(height: 15.0),


                    Text(
                      'Interests:',
                      textAlign: TextAlign.left,
                      style: TextStyle(

                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),

                    new Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.fromLTRB(12.0,5.0,2.0,50.0),
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blue)
                      ),
                      child: new Text("$currentUserinterests",textAlign: TextAlign.left),

                    ),


                    SizedBox(height: 15.0),


                    Text(
                      'Descripition:',
                      textAlign: TextAlign.left,
                      style: TextStyle(

                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),

                    new Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.fromLTRB(12.0,5.0,2.0,50.0),
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blue)
                      ),
                      child: new Text("$currentUserDescripition",textAlign: TextAlign.left),

                    ),

                    SizedBox(height: 30.0),
                    Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(

                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(30.0),
                              shadowColor: Colors.lightBlue.shade100,
                              elevation: 5.0,
                              child: MaterialButton(
                                minWidth: 340.0,
                                height: 42.0,
                                onPressed:() {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => editProfile()));
                                },
                                color: Colors.lightBlue,
                                child: Text('Edit Profile',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 25.0),
                  ],
                )
            )
          ],

        )

    );
  }



}