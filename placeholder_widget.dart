/*
import 'package:flutter/material.dart';


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
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(

          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[

            SizedBox(height: 24.0),
            Text(
              'Event Name: ',
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 0.0),
            TextFormField(
            ),

            SizedBox(height: 35.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Time: From      ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Icon(Icons.check_box_outline_blank),
                  Text(
                    '     , To      ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Icon(Icons.check_box_outline_blank),],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Date: From      ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Icon(Icons.check_box_outline_blank),
                  Text(
                    '     , To      ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Icon(Icons.check_box_outline_blank),],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
              ClipPath(
              child: Container(color: Colors.black26.withOpacity(0.8)),
        clipper: getClipper(),
      ),
      Positioned(

        //width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.width,
        top: MediaQuery.of(context).size.height / 20,

        child: ListView(
          shrinkWrap: true,
          children: <Widget>[

            Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,

                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 7.0, color: Colors.black)
                    ])),

            SizedBox(height: 50.0),
            Text(
              'Khalid Mohammad',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
            SizedBox(height: 15.0),
            Text(
              'I am KFUPM Student , Senior SWE Student',
              style: TextStyle(
                  fontSize: 17.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Montserrat'),
            ),

            SizedBox(height: 100.0),
            Container(
                height: 50.0,
                width: 150.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'Attendance Record',
                        style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 25.0),
            Container(
                height: 50.0,
                width: 150.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'Notifications',
                        style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 25.0),
            Container(
                height: 50.0,
                width: 150.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'Settings',
                        style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
  var path = new Path();

  path.lineTo(0.0, size.height / 7);
  path.lineTo(size.width + 6000, 0);
  path.close();
  return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
  // TODO: implement shouldReclip
  return true;
  }
  }
}
*/
import 'package:flutter/material.dart';
import 'globals.dart';

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
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: new Stack(

          alignment: Alignment.center,


          children: <Widget>[

            /*Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,

                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 7.0, color: Colors.black)
                    ])),*/
            Positioned(

              //width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.width,
              //top: MediaQuery.of(context).size.height / 20,

                child: ListView(

                  //shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(height: 100.0),
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
                      '$currentUserDescripition',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),

                    SizedBox(height: 50.0),
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
                                minWidth: 370.0,
                                height: 42.0,
                                //onPressed: _eventCreated,
                                color: Colors.lightBlue,
                                child: Text('Edit Profile', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //SizedBox(height: 10.0),
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
                                minWidth: 370.0,
                                height: 42.0,
                                //onPressed: _eventCreated,
                                color: Colors.lightBlue,
                                child: Text('Notification', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 10.0),
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
                                minWidth: 370.0,
                                height: 42.0,
                                //onPressed: _eventCreated,
                                color: Colors.lightBlue,
                                child: Text('Settinges', style: TextStyle(color: Colors.white)),
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
  Future<void> _forgetPassword() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset you Password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You recived an email to'),
                Text('reset your password'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}




/*
import 'package:flutter/material.dart';
import 'layout_type.dart';
import 'main_app_bar.dart';

class Contact {
  Contact({this.name, this.email});
  final String name;
  final String email;
}

class PlaceholderWidget extends StatelessWidget implements HasLayoutGroup {
  PlaceholderWidget({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: layoutGroup,
        layoutType: LayoutType.list,
        onLayoutToggle: onLayoutToggle,
      ),
      body: Container(

        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    new Container(

        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
            color: Colors.blueGrey,

            borderRadius: BorderRadius.all(Radius.circular(75.0)),
            boxShadow: [
              BoxShadow(blurRadius: 7.0, color: Colors.black)
            ]));

    new SizedBox(height: 50.0);
    new Text(
    'Khalid Mohammad',
    style: TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat'),
    );
    new SizedBox(height: 15.0);
    new Text(
    'I am KFUPM Student , Senior SWE Student',
    style: TextStyle(
    fontSize: 17.0,
    fontStyle: FontStyle.italic,
    fontFamily: 'Montserrat'),
    );
    return ListView.builder(

        itemCount: allContacts.length,
        itemBuilder: (BuildContext content, int index) {
          Contact contact = allContacts[index];
          return ContactListTile(contact);
        });
  }
}

class ContactListTile extends ListTile {
  ContactListTile(Contact contact)
      : super(
    title: Text(contact.name),

  );
}

List<Contact> allContacts = [
  Contact(name: 'event' ),
  Contact(name: 'notify'),
  Contact(name: 'settinges'),

];
*/