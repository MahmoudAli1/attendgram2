import 'package:flutter/material.dart';
import 'Record_Page.dart';
import 'globals.dart';
import 'package:firebase_database/firebase_database.dart';
import 'myData.dart';
import 'search_page.dart';
class EventInfoPage extends StatefulWidget {
  static String tag = 'event-info-page';
  var eventNum = eventIndex;
  EventInfoPage(this.eventNum);
  @override
  State<StatefulWidget> createState() {
    return _EventInfoPageState(eventNum);
  }
}

class _EventInfoPageState extends State<EventInfoPage> {
  _EventInfoPageState(var eventNum);
   List<myData> allData= [];
  static var eventName, eventStartingTime, eventFinishingTime, eventAccessability;
  DateTime eventStartingDate = new DateTime(1960), eventFinishingDate = new DateTime(1960);
  String _participantEmail;
  var occurrences ;
  var occurr=1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Events').once().then((DataSnapshot snap) {
      var data = snap.value;
     // allData.clear();
      print(eventIndex);
      print("####################################################");

//      eventData d = new eventData(
//        data[eventIndex]['Event Name'],
//        data[eventIndex]['Starting Date'],
//        data[eventIndex]['Finishing Date'],
//        data[eventIndex]['Starting Time'],
//        data[eventIndex]['Finishing Time'],
//        data[eventIndex]['Accessability'],
//        data[eventIndex]['AdminID'],
//        data[eventIndex]['Occur'],
//        eventIndex,
//      );

      DateTime fDate = new DateTime.fromMillisecondsSinceEpoch(data[eventIndex]['Finishing Date']);
      DateTime sDate = new DateTime.fromMillisecondsSinceEpoch(data[eventIndex]['Starting Date']);

      eventName=data[eventIndex]['Event Name'];
      eventStartingDate=sDate;
      eventFinishingDate=fDate;
      eventStartingTime=data[eventIndex]['Starting Time'];
      eventFinishingTime=data[eventIndex]['Finishing Time'];
      if(data[eventIndex]['Accessability']) eventAccessability= "Public";
      else eventAccessability= "Private";
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventTitle = Text(
      '$eventName',
      style: TextStyle(fontSize: 30.0, color: Colors.blue),
      textAlign: TextAlign.center,
    );

    final time = Text(
      'Time: from $eventStartingTime, to $eventFinishingTime',
      style: TextStyle(color: Colors.black54),
    );

    final date = Text(
      'Date: from ${eventStartingDate.day}/${eventStartingDate.month}/${eventStartingDate.year}, to ${eventFinishingDate.day}/${eventFinishingDate.month}/${eventFinishingDate.year} \n',
      style: TextStyle(color: Colors.black54),
    );

    final type = Text(
      'Type: ${eventAccessability}',
      style: TextStyle(color: Colors.black54),
    );

    final myRecord = FlatButton(
      child: Text(
        'My Record',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(RecordPage.tag);
      },
    );

    final requestTimeOff = FlatButton(
      child: Text(
        'Request Time Off',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
      },
    );

    final requestLeave = FlatButton(
      child: Text(
        'Request Leave',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
      },
    );

    final recordIcon = Icon(Icons.featured_play_list);
    final timeOffIcon = Icon(Icons.watch_later);
    final leaveIcon = Icon(Icons.directions_walk);


    return Scaffold(
      appBar: AppBar(
        title: Text('Event'),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            eventTitle,
            SizedBox(height: 8.0),
            time,
            SizedBox(height: 8.0),
            date,
            SizedBox(height: 8.0),
            type,
            SizedBox(height: 24.0),
            Center(
              child: new Row(
                children: <Widget>[recordIcon, myRecord],
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: new Row(
                children: <Widget>[timeOffIcon, requestTimeOff],
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              widthFactor: 25,
              child: new Row(
                children: <Widget>[leaveIcon, requestLeave],
              ),
            ),
            SizedBox(height: 8.0),
            Center(
                  child: _CheckAdmin(Event_Admin) == true ? new Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.lightBlue.shade100,
                    elevation: 5.0,
                    child: MaterialButton(
                      minWidth: 200.0,
                      height: 42.0,
                      onPressed: _addParticipantPopUp,
                      color: Colors.lightBlue,
                      child: Text('Add Participant $Event_Admin // $globalUserId  ', style: TextStyle(color: Colors.white)),
                    ),
                  )
                      : _decide()

            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
  Future<void> _AttendenceConfirmation() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attendence Confirmed'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You attended seccessfully'),
                //Text('reset your password'),
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

  _CheckAdmin(AdminID){

    if(AdminID==globalUserId) {
      return true;
    }

    return false ;
  }

  _decide(){


    if (currentEventAdmin.values.contains('$eventIndex')){
      return _ConfirmButton;
    }
    else{
      return new Material(
          borderRadius: BorderRadius.circular(30.0),
    shadowColor: Colors.lightBlue.shade100,
    elevation: 5.0,
    child: MaterialButton(
    minWidth: 200.0,
    height: 42.0,
    onPressed: _joinEvent,
    color: Colors.lightBlue,
    child: Text('Join Event', style: TextStyle(color: Colors.white)),
    )
      );
  }
  }

  _ConfirmButton(){
    return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent.shade100,
      elevation: 5.0,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42.0,

        onPressed: () {
          DatabaseReference ref = FirebaseDatabase.instance.reference();
          ref.child("Events").child('$eventIndex').child('Occurrences').once().then((DataSnapshot snap){
            Map<dynamic,dynamic> data = snap.value ;
            var occurrenceIndex = data.entries ;
            occurr = occurrenceIndex.last.value;
            _AttendenceConfirmation;
            print(occurrenceIndex);
//              occurrenceIndex.forEach((index){
//                 occurrences = index.key ;
//                 occurr = occurrences.length();
//                 occurr++ ;
//                 print(occurr) ;
//                 print("this is occ") ;
//              });


          });

          ref.child("Events").child('$eventIndex').child('Occurrences').child('$occurr');
          Map<dynamic,dynamic> UserAttendance = {
            '$globalUserId' : 'P'
          };
          ref.child("Events").child('$eventIndex').child('Occurrences').child('$occurr').child('${UserAttendance.keys.first}')
              .set(UserAttendance['$globalUserId']);
          occurr++ ;
        },
        color: Colors.lightBlueAccent,
        child: Text('Confirm Attendance', style: TextStyle(color: Colors.white)),
      ),
    ),
  );}


  Future<void> _addParticipantPopUp() async{

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form( key: _formKey ,
            child : AlertDialog(
            title: Text('Enter User Email'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'Type Event Name ',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                    onSaved: (input) => _participantEmail = input,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Confirm'),
                onPressed: _addParticipant,
              ),
            ],
        ),
        );
      },
    );

  }

  Future<void> _joinEvent() async {
    DatabaseReference Ref = FirebaseDatabase.instance.reference();
    Ref.child('Users').child(globalUserId).child('Event_Ids').child(eventIndex).set(eventIndex);

    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('User Added'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You Joined this Event Successfully'),
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

    return Navigator.push(context,
        MaterialPageRoute(builder: (context) => search()));


  }

  Future<void> _addParticipant() async {
    print("#######################");

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        DatabaseReference Ref = FirebaseDatabase.instance.reference() ;
        var userList = Ref.child('Users').once();
        userList.then((DataSnapshot snap){
          Map<dynamic,dynamic> map = snap.value ;
          var keys = map.entries;
          var values = map.values;

          print("keysssss : ${keys}");

          keys.forEach((k){
            Map<dynamic,dynamic> map1 = k.value ;
            var UserFields = map1.entries ;
            var UserValues = map1.values;

            print(' ############################## \n UserFieilds: $UserFields\n UserValues:$UserValues\n  Values:$values \n Keys:$keys ');
            UserFields.forEach((i){

              if(i.key == 'email'){

                if(i.value == _participantEmail){

                  print("FOUND IT : ${i.value}");
                  print("k.key : ${k.key}");
                  Ref.child('Users').child(k.key).child('Event_Ids').child(eventIndex).set(
                    eventIndex
                  );

                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('User Added'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('A new user is created Successfully'),
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
                  // success = true ;
                }


              }

            });//internal loop
          });// external loop





        });



        }catch(e){
        print(e.message);
      }
    }
  }



}