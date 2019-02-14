/*import 'package:flutter/material.dart';

class CreateEventTab extends StatelessWidget {
  CreateEventTab();

  class CreateEventTab extends StatefulWidget {
  static String tag = 'createEvent-page';
  @override
  _CreateEventState createState() => new _CreateEventState();
  }

  class _LoginPageState extends State<LoginPage> {

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
                  Text(
                'Type:',
                style: TextStyle(color: Colors.black54),),
              Radio(

              ),
              Text(
                'Public',
                style: TextStyle(color: Colors.black54),
              ),
              Radio(
                value: false,
              ),
              Text(
                'Private',
                style: TextStyle(color: Colors.black54),
              )],
              ),
            ),
            SizedBox(height: 80.0),

        Padding(

          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: _eventCreated,
              color: Colors.lightBlueAccent,
              child: Text('Create Event', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }

  Future<void> _eventCreated() async {
    return showDialog<void>(
     // context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Created'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('A new event are created Successfully'),
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
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'home_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'globals.dart';


class CreateEventTab extends StatefulWidget {
  static String tag = 'login-page';
  noSuchMethod(Invocation i) => super.noSuchMethod(i);
  @override
  _CreateEventState createState() => new _CreateEventState();
}

class _CreateEventState extends State<CreateEventTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _value = false;
  List<bool> occur = [false, false, false, false, false, false, false];
  String _eventName ;
  String FinishingDateText = "Select Finishing Date", StartingDateText="Select Starting Date", FinishingTimeText= "Select Finishing Time", StartingTimeText= "Select Starting Time";
  DateTime  startingDate, finishingDate ;
  var eventStartingTime, eventFinishingTime ;

  var success = false ;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body:Form(
        key: _formKey,
        child: ListView(

          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[

            SizedBox(height: 24.0),
            Text(
              'Event Name: ',
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              validator: (val) => val.isEmpty ? 'Event name can\'t be empty.' : null,

              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                hintText: 'Type Event Name ',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
              onSaved: (input) => _eventName = input,
            ),

            SizedBox(height: 35.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Starting Time:         ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  RaisedButton (
                    child: Text('${StartingTimeText}'),
                    onPressed: _selectStartingTime ,
                    color: Colors.lightBlue,
                    textColor:  Colors.white,
                  ),],
              ),
            ),
            SizedBox(height: 35.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Finishing Time:       ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  RaisedButton (
                    child: Text('${FinishingTimeText}'),
                    onPressed: _selectFinishingTime ,
                    color: Colors.lightBlue,
                    textColor:  Colors.white,
                  ),],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Starting Date:          ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  RaisedButton (
                    child: Text('$StartingDateText'),
                    onPressed: _startingDatePicker ,
                    color: Colors.lightBlue,
                    textColor:  Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Finishing Date:       ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  RaisedButton (
                    child: Text('$FinishingDateText'),
                    onPressed: _finishingDatePicker ,
                    color: Colors.lightBlue,
                    textColor:  Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Public:   ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  new Switch(value: _value, onChanged: (bool value){_onChanged(value);}),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Weekdays: ',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Row(
                            children: <Widget>[
                              Text(
                                'Sat:  ',
                                style: TextStyle(color: Colors.black54),
                              ),
                              new Checkbox(value: occur[0], onChanged: (bool value){_onChangedDays(0, value);}),
                              Text(
                                'Sun:',
                                style: TextStyle(color: Colors.black54),
                              ),
                              new Checkbox(value: occur[1], onChanged: (bool value){_onChangedDays(1, value);}),
                              Text(
                                'Mon:',
                                style: TextStyle(color: Colors.black54),
                              ),
                              new Checkbox(value: occur[2], onChanged: (bool value){_onChangedDays(2, value);}),
                              Text(
                                'Tue:',
                                style: TextStyle(color: Colors.black54),
                              ),
                              new Checkbox(value: occur[3], onChanged: (bool value){_onChangedDays(3, value);}),
                            ]

                        ),
                      ]
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Row(
                            children: <Widget>[
                              Text(
                                'Wed:',
                                style: TextStyle(color: Colors.black54),
                              ),
                              new Checkbox(value: occur[4], onChanged: (bool value){_onChangedDays(4, value);}),
                              Text(
                                'Thu:',
                                style: TextStyle(color: Colors.black54),
                              ),
                              new Checkbox(value: occur[5], onChanged: (bool value){_onChangedDays(5, value);}),
                              Text(
                                'Fri:  ',
                                style: TextStyle(color: Colors.black54),
                              ),
                              new Checkbox(value: occur[6], onChanged: (bool value){_onChangedDays(6, value);}),
                            ]
                        ),

                      ]
                  ),
                ],
              ),
            ),



            SizedBox(height: 20.0),

            Padding(

              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Colors.lightBlue.shade100,
                elevation: 5.0,
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  onPressed: _eventCreated,
                  color: Colors.lightBlue,
                  child: Text('Create Event', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future<void> _eventCreated() async {

    _createEventCall();

    if(success){

      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Event Created'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('A new event are created Successfully'),
                  // Text('reset your password'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Confirm'),
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




  Future<void> _occurInit() async {
    for(int i = 0; i < 8; i++){
      occur[i] = false;
    }
    setState(() {});
  }
  Future<void> _startingDatePicker() async {
    final DateTime picker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );
    StartingDateText="${picker.day}/${picker.month}/${picker.year}";
    startingDate = picker;

    setState(() {});
  }

  Future<void> _finishingDatePicker() async {
    final DateTime picker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );
    FinishingDateText="${picker.day}/${picker.month}/${picker.year}";
    finishingDate =  picker;



    setState(() {});
  }

  Future<void> _selectStartingTime() async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    StartingTimeText = "${picked.hour}:${picked.minute}";
    eventStartingTime= "${picked.hour}:${picked.minute}";

    setState(() {

    });
  }


  Future<void> _selectFinishingTime() async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    FinishingTimeText = "${picked.hour}:${picked.minute}";
    eventFinishingTime =  "${picked.hour}:${picked.minute}";
    setState(() {

    });
  }
  void _onChanged(bool value){
    setState(() {
      _value = value;
    });
  }

  void _onChangedDays(var i, bool value){
    setState(() {
      occur[i] = value;
    });
  }

  Future<void> _createEventCall() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
//        for(int i = 0; i < 7; i++){
//          if
//          occur[i]
//        }
        DatabaseReference Ref = FirebaseDatabase.instance.reference() ;
        print("innnnnnn############################################# ${_eventName}") ;
        print("${eventStartingTime} ${eventFinishingTime} ${startingDate} ${finishingDate} ${occur[0]}") ;
        print(occur[0]);

        var eventKey =Ref.child('Events').push().key;
        var eventID = Ref.child('Events').child(eventKey).set(
            {
              "Event Name": _eventName
              , "Starting Time" : eventStartingTime.toString(), "Finishing Time" : eventFinishingTime.toString()
              , "Starting Date" : startingDate.millisecondsSinceEpoch, "Finishing Date" : finishingDate.millisecondsSinceEpoch, "Accessability" : _value, "AdminID" : globalUserId, "Occur" : occur
            }

        );

        Ref.child('Users').child(globalUserId).child('Event_Admin').child(eventKey).set(eventKey);
        Ref.child('Users').child(globalUserId).child('Event_Ids').child(eventKey).set(eventKey);

        // I Need to add the event to the event list in the user
       // Ref.child('Users').child(globalUserId).child('Event_Ids').setPriority(eventKey) ;


        success = true ;

      }catch(e){
        print(e.message);
      }
    }
  }
}