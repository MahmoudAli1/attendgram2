import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'myData.dart';
import 'event_info_page.dart';
import 'dart:developer';
import 'globals.dart';
import 'package:firebase_auth/firebase_auth.dart' ;


//Our MyApp class. Represents our application
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView SearchView",
      home: new search(),
      theme: ThemeData(primaryColor: Colors.blueGrey),
    );
  }
}
//Represents the Homepage widget
class search extends StatefulWidget {
  //`createState()` will create the mutable state for this widget at
  //a given location in the tree.
  @override
  _HomeState createState() => _HomeState();
}

//Our Home state, the logic and internal state for a StatefulWidget.
class _HomeState extends State<search> {
  //A controller for an editable text field.
  //Whenever the user modifies a text field with an associated
  //TextEditingController, the text field updates value and the
  //controller notifies its listeners.
  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<eventData> allData;
  List<eventData> _filterList;

  @override
  void initState() {
    super.initState();
    inti();

  }

  inti(){

    allData = new List<eventData>();
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var Events = ref.child('Events');



    Events.once().then((DataSnapshot snap){
      allData.clear();
      Map<dynamic,dynamic> map = snap.value ;
      var keys = map.entries ;
      var data = map.values;


      keys.forEach((k) {
        print("###################################################");
        print(k);
        print("###################################################");

          if(map[k.key]['Accessability']==true){
            eventData d = new eventData(
              map[k.key]['Event Name'],
              map[k.key]['Starting Date'],
              map[k.key]['Finishing Date'],
              map[k.key]['Starting Time'],
              map[k.key]['Finishing Time'],
              map[k.key]['Accessability'],
              map[k.key]['AdminID'],
              map[k.key]['Occur'],
              k.key,
            );
            allData.add(d);
          }



        print("###################################################");
        //print(allData[0].StartingDate);




      });

    });


  }

  _HomeState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

//Build our Home widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text("Event Search "),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 2.0, right: 2.0, top: 5.0),
        child: new Column(
          children: <Widget>[
            _createSearchView(),

            _firstSearch ? _createListView() : _performSearch()
          ],
        ),
      ),
    );
  }
  //Create a SearchView
  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 0.5) ,color:Colors.white,borderRadius: new BorderRadius.circular(25.0),),

      child: new TextField(



        controller: _searchview,
        decoration: InputDecoration(
          hintText: "Search",


          hintStyle: new TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.left,

      ),
    );
  }
  //Create a ListView widget
  Widget _createListView() {
    return new Flexible(
        child: new ListView.builder(
          itemCount: allData.length,
          itemBuilder: (_, index) {
            return UI(
              allData[index].EventName, allData[index].StartingDate, allData[index].FinishingDate, allData[index].StartingTime, allData[index].FinishingTime ,allData[index].Accessability,
              allData[index].EventID,allData[index].AdminID,
            );
          },
        )
    );
  }
  //Perform actual search
  Widget _performSearch() {
    _filterList = new List<eventData>();
    for (int i = 0; i < allData.length; i++) {
      var item = allData[i].EventName;
      var itemC = allData[i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        if(allData[i].Accessability==true)
          {
            _filterList.add(itemC);
          }

      }
    }
    return _createFilteredListView();
  }
  //Create the Filtered ListView
  Widget _createFilteredListView() {
    return new Flexible(
        child: new ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (_, index) {
            return UI(
              _filterList[index].EventName, _filterList[index].StartingDate, _filterList[index].FinishingDate, _filterList[index].StartingTime, _filterList[index].FinishingTime ,_filterList[index].Accessability,
              _filterList[index].EventID,_filterList[index].AdminID,
            );
          },
        )
    );
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
                Event_Admin=eventAdmin ;
//                pageIndex = i ;
                Navigator.of(context).pushNamed(EventInfoPage.tag);
              },
            ),
            new Center(
              // child: _CheckType(Accessability) == true ? new Icon(Icons.add_circle) : new Icon(Icons.do_not_disturb_on)
            )

          ],
        ),
      ),
    );
  }

}

