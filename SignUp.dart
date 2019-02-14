import 'package:firebase_auth/firebase_auth.dart';
import 'home_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'globals.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password,_UserName;


  DatabaseReference Ref;
  FirebaseUser user;



  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,

      body: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 30.0),
              Image.asset(

                'assets/images/attendgram.png',
                height: 200,
                width: 200,

                alignment: Alignment.center,



              ),
              SizedBox(height: 15.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,

                obscureText: false,

                decoration: InputDecoration(
                  hintText: 'User Name ',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (input) => _UserName = input,
              ),
              SizedBox(height: 15.0),
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



              SizedBox(height: 40.0),
              Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(

                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        shadowColor: Colors.lightBlue.shade100,
                        //elevation: 5.0,
                        child: MaterialButton(
                          minWidth: 330.0,
                          height: 42.0,
                          onPressed: SignUP,
                          color: Colors.lightBlue,
                          child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          )
      ),
    );
  }

  void SignUP() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
         user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);

         Ref = FirebaseDatabase.instance.reference();

        userEntry newuser= userEntry(_UserName);

        Ref.child('Users').setPriority(user.uid);
        Ref.child('Users').child(user.uid).set(newuser.toJson());

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





class userEntry {

  String Name;


  userEntry(this.Name);

  toJson() {
    return {

      "Name": Name,
      "descrption":'',
      "interests":'',
      "Event_Ids":'',
      "Event_Admin":'',



    };
  }
}