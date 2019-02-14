import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart' ;
import 'myData.dart';
import 'globals.dart';
import 'event_info_page.dart';

class RecordPage extends StatefulWidget {
  static String tag = 'Record-page';
  @override
  State<StatefulWidget> createState() {
    return _RecordPageState();
  }
}

class _RecordPageState extends State<RecordPage> {

//  @override
//  Widget build(BuildContext context) {
//    final eventName = Text(
//      'item 0',
//      style: TextStyle(fontSize: 30.0, color: Colors.blue),
//      textAlign: TextAlign.center,
//    );
//
//    final absences = Text(
//      'Number of absences: 1',
//      style: TextStyle(color: Colors.black54),
//    );
//
//    final precentage = Text(
//      'Attendance precentage: --%',
//      style: TextStyle(color: Colors.black54),
//    );
//
//    final eventstate = Text(
//      'Event state: Active',
//      style: TextStyle(color: Colors.black54),
//    );
//
//    final recordTable = Text(
//      'Record Table',
//      style: TextStyle(fontSize: 30.0, color: Colors.orange),
//      textAlign: TextAlign.center,
//    );
//
//    final record1 = Text(
//      '15, Nov, 2018       P',
//      style: TextStyle(color: Colors.lightBlueAccent),
//    );
//
//    final record2 = Text(
//      '17, Nov, 2018       A',
//      style: TextStyle(color: Colors.redAccent),
//    );
//
//    final record3 = Text(
//      '19, Nov, 2018       P',
//      style: TextStyle(color: Colors.lightBlueAccent),
//    );



//
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: Center(
//        child: ListView(
//          shrinkWrap: true,
//          padding: EdgeInsets.only(left: 24.0, right: 24.0),
//          children: <Widget>[
//            Center(
//              child: new Row(
//                children: <Widget>[record1],
//              ),
//            ),
//            SizedBox(height: 8.0),
//            Center(
//              child: new Row(
//                children: <Widget>[record2],
//              ),
//            ),
//            SizedBox(height: 8.0),
//            Center(
//              widthFactor: 25,
//              child: new Row(
//                children: <Widget>[record3],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }


  List<myData> allData = [];
  List<String> record = [];
  var id ;
  var UserEvenIndex = [] ;
  var IDs ;
  var numOfAbsences;
  var numOfOcer=0;
  bool test=true;
  static String eventName;

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      id = user.uid;
    });

    var currentUser = ref.child('Users');

    currentUser.once().then((DataSnapshot snap){
      Map<dynamic,dynamic> map = snap.value ;
      var data = map.values ;
      var keys = map.entries ;
      keys.forEach((k) {
        var eventIDs = k.key ;
        if (eventIDs == 'EventIDs'){
          IDs = k.value ;
        }

      });
      print('this is $data') ;
      print(keys) ;
      print("this is the new code here") ;
//          for (var i in indexes){
//            UserEvenIndex[i] =data[i]['EventIDs'] ;
//          }
    });
    ref.child('Events').once().then((DataSnapshot snap) {
//        var index = [0, 1, 2, 3];
      var data = snap.value;

        eventName=data[eventIndex]['name'];

      setState(() {
      });

    });
    ref.child('Events').child('$eventIndex').child('Occurrences').once().then((DataSnapshot snap) {
      var data = snap.value;
      record.clear();
      try{
        for(var i =0; data[i] != null ; i++){
          numOfOcer++;
          record.add(data[i][globalUserId]);
        }
      }catch(e){
      }

      String j = record[0];
      print('This is number of Ocer(try): $numOfOcer');
      print('This is record: $j');


      setState(() {
      });

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record'),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Container(

          child: new ListView.builder(
            itemCount: record.length,
            itemBuilder: (_, index) {
              return UI(index);
            },
          )),
      );
  }

  Widget UI(var index) {

    if(record[index] != null){
      return new Card(
        child: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text('Day ${index+1}:      ${record[index]}  '),
            ],
          ),
        ),
      );

    }

  else {
      return new Card(
        child: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text('Day ${index + 1}:      A  '),
            ],
          ),
        ),
      );
    }
  }
}