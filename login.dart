
import 'package:firebase_auth/firebase_auth.dart';
import 'home_widget.dart';
import 'SignUp.dart';
import 'package:flutter/material.dart';
import 'globals.dart';
import 'package:firebase_database/firebase_database.dart';
import 'myData.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  noSuchMethod(Invocation i) => super.noSuchMethod(i);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  DatabaseReference Ref;
  Map<dynamic,dynamic> map ;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,

      body: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 100.0),
              Image.asset(

                'assets/images/attendgram.png',
                height: 300,
                width: 250,

                alignment: Alignment.center,



              ),
              TextFormField(

                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,

                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (input) => _email = input,
              ),
              SizedBox(height: 15.0),
              TextFormField(
                autofocus: false,

                obscureText: true,
                validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (input) => _password = input,
              ),

              SizedBox(height: 30.0),
              Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(

                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        shadowColor: Colors.lightBlue.shade100,
                        //elevation: 5.0,
                        child: MaterialButton(
                          minWidth: 330.0,
                          height: 42.0,
                          onPressed: signIn,
                          color: Colors.lightBlue,
                          child: Text('SignIn', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(

                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        shadowColor: Colors.lightBlue.shade100,
                        //elevation: 5.0,
                        child: MaterialButton(
                          minWidth: 330.0,
                          height: 42.0,
                          onPressed:() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SignUp()));
                          },
                          color: Colors.lightBlue,
                          child: Text('SignUp', style: TextStyle(color: Colors.white)),
                        ),

                      ),

                    ),

                  ],
                ),
              ),

              FlatButton(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.black54),
                ),

              ),
            ],
          )
      ),
    );
  }

  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        globalUserId=user.uid;
        Ref = FirebaseDatabase.instance.reference();



        Ref.child('Users').child(globalUserId).once().then((DataSnapshot snap) {
          map = snap.value;
          currentUserName = map['Name'];
          currentUserDescripition = map['descrption'];
          currentUserinterests = map['interests'];
          currentEventAdmin = map['Event_Admin'];



          // allData.clear();

//          userInfo d = new userInfo(
//              data['Name'],
//              data['descrption'],
//              data['interests'],
//              data['Event_Ids'],
//              data['Event_Admin']
//
//          );
//
//
//          print(currentUserName);
//          print("##_#_#_#_#_#_#_#_#_#_#_#_# $currentUserinterests");



          setState(() {
          });

        });


        currentEventIDs = map['Event_Ids'] ;


        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user:user)));
      }catch(e){
        _errorOccurred(e.message);
        print(e.message);

      }
    }
  }


  Future<void> _errorOccurred(String e) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error Occurred'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(e),

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