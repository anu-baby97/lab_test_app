import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingDemo extends StatefulWidget {
  static const String id = "BookingDemo";
  @override
  _BookingDemoState createState() => _BookingDemoState();
}

class _BookingDemoState extends State<BookingDemo> {
  List<bool> isSelected = [false, true, false];
  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();
  List<FocusNode> focusToggle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusToggle = [focusNodeButton1, focusNodeButton2, focusNodeButton3];
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNodeButton1.dispose();
    focusNodeButton2.dispose();
    focusNodeButton3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ToggleButtons(
                color: Colors.greenAccent,
                selectedColor: Colors.amberAccent,
                fillColor: Colors.purple,
                splashColor: Colors.lightBlue,
                highlightColor: Colors.lightBlue,
                borderColor: Colors.white,
                borderWidth: 5,
                selectedBorderColor: Colors.greenAccent,
                renderBorder: true,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                disabledColor: Colors.blueGrey,
                disabledBorderColor: Colors.blueGrey,
                focusColor: Colors.red,
                focusNodes: focusToggle,
                children: <Widget>[
                  Icon(Icons.format_bold),
                  Icon(Icons.format_italic),
                  Icon(Icons.link),
                ],
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    isSelected[index] = !isSelected[index];
                  });
                },
              ),
              /* StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection("appointments").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final details = snapshot.data.docs;
                      List<Text> detailWidgets = [];
                      for (var detail in details) {
                        final detailsText = detail.data().toString();
                        final detailWidget = Text('$detailsText');
                        detailWidgets.add(detailWidget);
                      }
                    }
                    return Column(
                      children: detailWidgets,
                    );
                  })*/
            ],
          ),
        ),
      ),
    );
  }
}
/* void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }*/

/*ListTile(

tileColor: Colors.cyan.shade100,
leading: Text("Test Name: ",style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 17)),
title: Text(FirebaseFirestore.instance.collection("Appointments Summary").where("Test Name"),style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 17)),
),*/
/*
ListTile(
tileColor: Colors.cyan.shade200,
leading: Text("Laboratory Name: ",style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 17)),
title: Text(snapshot.data.docs[2]['Selected Laboratory'],style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 17)),
),
ListTile(
tileColor: Colors.cyan.shade300,
leading: Text("Date and Time: ",style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 17)),
title: Text(snapshot.data.docs[0]['Date and Time'],style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 17)),
),
ListTile(
tileColor: Colors.cyan.shade400,
leading: Text("Fees: ",style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 17)),
title: Text(snapshot.data.docs[2]['Fees'].toString(),style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 17)),
),*/
