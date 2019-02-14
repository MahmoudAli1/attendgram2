import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'myData.dart';
import 'event_info_page.dart';
import 'dart:developer';
import 'globals.dart';
import 'package:firebase_auth/firebase_auth.dart' ;
//import "package:intl/intl_browser.dart";


class ShowDataPage extends StatefulWidget {

  @override
  _ShowDataPageState createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  List<eventData> allData = [];
  var id ;
  var UserEvenIndex = [] ;
  List<String> IDs ;
  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
//    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
//      id = user.uid;
//
//    });
    var currentUser = ref.child('Users').child(globalUserId).child('Event_Ids');



    currentUser.once().then((DataSnapshot snap){
      allData.clear();
      Map<dynamic,dynamic> map = snap.value ;
      var keys = map.entries ;
      print("###################################################");

      keys.forEach((k) {

        ref.child('Events').once().then((DataSnapshot snap) {
          var data = snap.value;

          print(k.value);
          print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
          print(data[k.value]['Starting Date']);
          eventData d = new eventData(
            data[k.value]['Event Name'],
            data[k.value]['Starting Date'],
            data[k.value]['Finishing Date'],
            data[k.value]['Starting Time'],
            data[k.value]['Finishing Time'],
            data[k.value]['Accessability'],
            data[k.value]['AdminID'],
            data[k.value]['Occur'],
            k.value,
          );

          allData.add(d);
          print("###################################################");
          //print(allData[0].StartingDate);
//          if(allData[0].AdminID == globalUserId) {
//            Event_Admin = allData[0].AdminID;
//          }
          setState(() {
            print('Length : ${allData.length}');
          });


        });

      });
    });
    //print(IDs);
//    ref.child('Events').once().then((DataSnapshot snap) {
//      var data = snap.value;
//      allData.clear();
//      for (var i in IDs) {
//        print(i);
//        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//        print(data[i]['Starting Date']);
//        eventData d = new eventData(
//            data[i]['Event Name'],
//            data[i]['Starting Date'],
//            data[i]['Finishing Date'],
//            data[i]['Starting Time'],
//            data[i]['Finishing Time'],
//          data[i]['Accessability'],
//          data[i]['AdminID'],
//          data[i]['Occur'],
//        );
//
//        allData.add(d);
//        print("###################################################");
//        //print(allData[0].StartingDate);
//        if(allData[0].AdminID == globalUserId) {
//          Event_Admin = allData[0].AdminID;
//        }
//      }
//      setState(() {
//        print('Length : ${allData.length}');
//      });
//
//    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text('Firebase Data'),
      ),
      body: new Container(
          child: allData.length == 0
              ? new Text(' No Data is Available')
              : new ListView.builder(
            itemCount: allData.length,
            itemBuilder: (_, index) {

              return UI(
                allData[index].EventName, allData[index].StartingDate, allData[index].FinishingDate, allData[index].StartingTime, allData[index].FinishingTime ,allData[index].Accessability,
                allData[index].EventID,allData[index].AdminID,
              );
            },
          )
      ),
    );
  }

  _CheckType (bool Accessability ){
    if(Accessability==true) {
      return true;
    }

    return false ;


  }

  Widget UI(var name, var StartingDate, var FinishingDate, var StartingTime, var FinishingTime, var Accessability, var j , var eventAdmin) {
    var sDate = new DateTime.fromMillisecondsSinceEpoch(StartingDate);
    var fDate = new DateTime.fromMillisecondsSinceEpoch(FinishingDate);
    print("${sDate.year}#############################################");
    return new Card(
      elevation: 10.0, // SHADOW
      color: Colors.blueGrey, // CARD COLOR
      // shape: ,
      child: new Container(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 5.0,
        ),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Container(
                width: 60.0,
                height: 60.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/en/thumb/9/98/King_Fahd_University_of"
                                "_Petroleum_%26_Minerals_Logo.svg/1200px-King_Fahd_Unive"
                                "rsity_of_Petroleum_%26_Minerals_Logo.svg.png")
                    )
                )),
            new FlatButton(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.title,
                  children: <TextSpan>[
                    TextSpan(
                      text: '$name\n',
                      style: TextStyle(color: Colors.amberAccent.withOpacity(0.6), fontSize: 20),
                    ),
                    TextSpan(
                      text: '${sDate.day}/${sDate.month}/${sDate.year} - ${fDate.day}/${fDate.month}/${fDate.year}\n',
                      style: TextStyle(color: Colors.lightBlue.withOpacity(0.8), fontSize: 15),
                    ),
                    TextSpan(
                      text: '$StartingTime - $FinishingTime',
                      style: TextStyle(color: Colors.greenAccent.withOpacity(1.0), fontSize: 15),
                    ),

                  ],
                ),
              ),
              onPressed: () {
          eventIndex=j;
          Event_Admin=eventAdmin;
//                pageIndex = i ;
                Navigator.of(context).pushNamed(EventInfoPage.tag);
              },
            ),
            new Center(
                child: _CheckType(Accessability) == true ? new Icon(Icons.add_circle) : new Icon(Icons.do_not_disturb_on)
            )

          ],
        ),
      ),
    );
  }
}