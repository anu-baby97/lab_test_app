import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_test_booking_app/Screens/BookingScreen.dart';
import 'package:lab_test_booking_app/Screens/LabInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class TestInfo extends StatefulWidget {
  static const String id = "TestInfoScreen";
  @override
  _TestInfoState createState() => _TestInfoState();
}

List testName = [
  "Blood Test",
  "Covid19 Test",
  "Glucose Test",
  "ECG",
  "Cholestrol Test",
  "CBC",
  "KFT",
  "LFT",
  "Pathology Test",
  "CMP",
  "Amniotic Fluid Test",
  /*AmylaseTest,
  CMP,
  CalcitoninTest,
  GlobulinTest*/
];

class _TestInfoState extends State<TestInfo> {
  String testSelect;
  final _firestore = FirebaseFirestore.instance;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  User loggedUsersName;
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  initState() {
    super.initState();
    getCurrentUser();
    /* _firestore
        .collection("Test Names").add(
        {'Test Names': testName

        });*/
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget addRadioButton(int btnValue, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18, fontFamily: "Poppins-Medium"),
          ),
          Flexible(child: SizedBox(width: double.infinity)),
          Radio(
            splashRadius: 50,
            focusColor: Colors.blue,
            activeColor: Theme.of(context).primaryColor,
            value: testName[btnValue],
            groupValue: testSelect,
            onChanged: (value) {
              setState(() {
                print(value);
                testSelect = value;
                _firestore
                    .collection("Appointments")
                    .doc(loggedInUser.uid)
                    .collection("Selected Test")
                    .add({
                  'Test Name': testSelect,
                });

                Navigator.pushNamed(context, LabInfo.id);
                if (testSelect.isEmpty) {
                  return "Select a test";
                }
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.white,
                  expandedHeight: 65,
                  snap: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: TextField(
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        onChanged: (value) {},
                        decoration: buildLocationInputDecoration()),
                  ),
                ),
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset("assets/image_01.png"),
                  ),
                  expandedHeight: 130,
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      Container(
                        decoration: buildBoxDecoration(),
                        child: addRadioButton(0, "Blood Test"),
                      ),
                      Container(
                        decoration: buildBoxDecoration(),
                        child: addRadioButton(1, "Covid-19 Test"),
                      ),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(2, "Glucose Test")),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(3, "ECG")),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(4, "Cholestrol Test")),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(5, "CBC")),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(6, "KFT")),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(7, "LFT")),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(8, "Pathology Test")),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(9, "CMP")),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(10, "Amniotic Fluid Test")),
                      SizedBox(
                        height: 15,
                      ),
                      /*BottomAppBar(

                          child: AppBar(
                        backgroundColor: Colors.cyan.shade200,
                        title: Text("NEXT"),
                      )),*/
                      /*Center(
                        child: FlatButton(
                          onPressed: () async {
                            _firestore.collection("test names").add({
                              'Test Name': testSelect,
                              'Current Logged User': loggedUser,
                            });
                            setState(() {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, LabInfo.id, (route) => true);
                              //showSpinner = true;
                            });
                          },
                          highlightColor: Colors.cyan,
                          focusColor: Colors.cyan.shade200,
                          color: Colors.cyan.shade100,
                          textColor: Colors.black,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.red,
                          splashColor: Colors.cyan.shade200,
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                fontFamily: "Lobster-Regular",
                                color: Colors.cyan.shade800,
                                fontSize: 27),
                          ),
                        ),
                      ),*/
                    ]),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildLocationInputDecoration() {
    return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Icon(
          Icons.search,
          color: Colors.cyan,
        ),
      ),
      hintText: 'Search for Tests  e.g. CBC etc.',
      hintStyle: TextStyle(
          fontFamily: "Lobster-Regular", color: Colors.grey, fontSize: 20),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.cyan.shade100,
              offset: Offset(0.0, 0.0),
              blurRadius: 15.0),
          BoxShadow(
              color: Colors.cyan.shade100,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0),
        ]);
  }
}
