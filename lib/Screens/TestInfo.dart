import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_test_booking_app/Screens/Lab1.dart';
import 'package:lab_test_booking_app/Screens/LabInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class TestInfo extends StatefulWidget {
  static const String id = "TestInfoScreen";
  @override
  _TestInfoState createState() => _TestInfoState();
}

List testName = [
  "Blood",
  "Covid19",
  "Glucose",
  /*ECG,
  Cholestrol,
  CBC,
  KFT,
  LFT,
  PathologyTest,
  AldoSteroneTest,
  AmnioticFluidTest,
  AmylaseTest,
  CMP,
  CalcitoninTest,
  GlobulinTest*/
];

class _TestInfoState extends State<TestInfo> {
  String testSelect;
  String loggedUser;
  final _firestore = FirebaseFirestore.instance;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
        loggedUser = loggedInUser.email;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget addRadioButton(int btnValue, String title) {
    return Row(
      children: <Widget>[
        Text(title),
        SizedBox(width: 20),
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: testName[btnValue],
          groupValue: testSelect,
          onChanged: (value) {
            setState(() {
              print(value);
              testSelect = value;
              if (testSelect.isEmpty) {
                return "Select a test";
              }
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          color: Colors.cyan,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
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
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, Lab1.id);
                              });
                            },
                            child: addRadioButton(1, "Covid-19 Test")),
                      ),
                      Container(
                          decoration: buildBoxDecoration(),
                          child: addRadioButton(2, "Glucose Test")),

                      /*Container(
                        decoration: buildBoxDecoration(),
                        child: ListTile(
                          title: Text("ECG "),
                          trailing: Radio(
                              value: TestName.ECG,
                              groupValue: _testName,
                              onChanged: (TestName value) {
                                setState(() {
                                  _testName = value;
                                });
                              }),
                        ),
                      ),
                      Container(
                        decoration: buildBoxDecoration(),
                        child: ListTile(
                          title: Text("CBC"),
                          trailing: Radio(
                              value: TestName.CBC,
                              groupValue: _testName,
                              onChanged: (TestName value) {
                                setState(() {
                                  _testName = value;
                                });
                              }),
                        ),
                      ),
                      Container(
                        decoration: buildBoxDecoration(),
                        child: ListTile(
                          title: Text("Calcitonin Test"),
                          trailing: Radio(
                              value: TestName.CalcitoninTest,
                              groupValue: _testName,
                              onChanged: (TestName value) {
                                setState(() {
                                  _testName = value;
                                });
                              }),
                        ),
                      ),
                      Container(
                        decoration: buildBoxDecoration(),
                        child: ListTile(
                          title: Text("Amylase Test"),
                          trailing: Radio(
                              value: TestName.AmylaseTest,
                              groupValue: _testName,
                              onChanged: (TestName value) {
                                setState(() {
                                  _testName = value;
                                });
                              }),
                        ),
                      ),
                      Container(
                        decoration: buildBoxDecoration(),
                        child: ListTile(
                          title: Text("Aldosterone Test"),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, Lab1.id);
                              });
                            },
                            child: Radio(
                                value: TestName.AldoSteroneTest,
                                groupValue: _testName,
                                onChanged: (TestName value) {
                                  setState(() {
                                    _testName = value;
                                  });
                                }),
                          ),
                        ),
                      ),
                      Container(
                        decoration: buildBoxDecoration(),
                        child: ListTile(
                          title: Text("Cholestrol"),
                          trailing: Radio(
                              value: TestName.Cholestrol,
                              groupValue: _testName,
                              onChanged: (TestName value) {
                                setState(() {
                                  _testName = value;
                                });
                              }),
                        ),
                      ),
                      Container(
                        decoration: buildBoxDecoration(),
                        child: ListTile(
                          title: Text("Amniotic Fluid Test"),
                          trailing: Radio(
                              value: TestName.AmnioticFluidTest,
                              groupValue: _testName,
                              onChanged: (TestName value) {
                                setState(() {
                                  _testName = value;
                                });
                              }),
                        ),
                      ),
                      Container(
                        decoration: buildBoxDecoration(),
                        child: ListTile(
                          title: Text("Globulin Test"),
                          trailing: Radio(
                              value: TestName.GlobulinTest,
                              groupValue: _testName,
                              onChanged: (TestName value) {
                                setState(() {
                                  _testName = value;
                                });
                              }),
                        ),
                      ),*/
                      SizedBox(
                        height: 10,
                      ),
                      Center(
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
                      ),
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
