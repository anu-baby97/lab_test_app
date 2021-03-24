import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_test_booking_app/Screens/LoginScreen.dart';
import 'package:lab_test_booking_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClinicRegistrationScreen extends StatefulWidget {
  static const String id = "ClinicRegistration";

  @override
  _ClinicRegistrationScreenState createState() =>
      _ClinicRegistrationScreenState();
}

class _ClinicRegistrationScreenState extends State<ClinicRegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedUser;
  final _firestore = FirebaseFirestore.instance;
  bool showSpinner = false;
  String name;
  String email;
  String staffno;
  Map<String, int> map1;
  String address;
  String phno;
  List timeslots;
  String password;
  String confirmpassword;
  String testname;
  String fees;
  bool ts1 = false;
  bool ts2 = false;
  bool ts3 = false;
  bool ts4 = false;
  bool ts5 = false;
  bool ts6 = false;
  bool ts7 = false;
  bool ts8 = false;
  bool ts9 = false;
  bool ts10 = false;
  bool ts11 = false;
  bool ts12 = false;
  bool ts13 = false;

  final GlobalKey<FormState> _regFormKey = GlobalKey<FormState>();

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  /*Widget addTestButton() => Container(
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 80, 0),
            child: Row(
              children: [
                TextFormField(
                  *//*onChanged: (value) {
                    testname = value;
                  },*//*
                  decoration: InputDecoration(
                      hintText: "Enter Test Name",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0)),
                ),
                TextFormField(
                  *//*onChanged: (value) {
                    fees = value;
                  },*//*
                  decoration: InputDecoration(
                      hintText: "Enter Fees",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0)),
                ),
              ],
            )),
      );*/
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0XFFB9D9E8),
            title: Text('Registration Page', style: TextStyle(fontSize: 20)),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            )),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Form(
              key: _regFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          autofocus: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Enter Name",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.0)),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                      child: TextFormField(
                        validator: emailValidator,
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.length < 10 || value.length > 10) {
                            return 'Phone number invalid';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          phno = value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixText: "      +91 ",
                            prefixStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "Enter Phone Number",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 80, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          address = value;
                        },
                        maxLines: 3,
                        decoration: InputDecoration(
                            hintText: "Enter Address",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("  Select Tests Available",style: TextStyle(fontSize: 18,color: Colors.cyan.shade200),),
                  SizedBox(
                    height: 30,
                  ),
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 80, 0),
                        child: Container(

                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (value) {
                                    testname = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Enter Test Name",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0)),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: TextFormField(
                                  onChanged: (value) {
                                    fees = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Enter Fees",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0)),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                       // addTestButton();
                      });
                    },
                    child: Text("Add Another Test"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("  Select Slots Available",style: TextStyle(fontSize: 18,color: Colors.cyan.shade200),),
                        CheckboxListTile(
                          value: this.ts1,
                          onChanged: (bool value) {
                            setState(() {
                              ts1 = value;
                             // timeslots.add("9.30");
                            });
                          },
                          title: Text("9.30"),
                        ),
                        CheckboxListTile(
                          value: this.ts2,
                          onChanged: (bool value) {
                            setState(() {
                              ts2 = value;
                             // timeslots.add("10.00");
                            });
                          },
                          title: Text("10.00"),
                        ),
                        CheckboxListTile(
                          value: this.ts3,
                          onChanged: (bool value) {
                            setState(() {
                              ts3 = value;
                             // timeslots.add("10.30");
                            });
                          },
                          title: Text("10.30"),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.length < 8) {
                            return 'Password must be longer than 8 characters';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                      child: TextField(
                        onChanged: (value) {
                          confirmpassword = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Re-enter Password",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15.0),
                          //contentPadding: EdgeInsets.all(10)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(80),
                  ),
                  InkWell(
                    child: Container(
                      width: ScreenUtil.getInstance().setWidth(900),
                      height: ScreenUtil.getInstance().setHeight(100),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0)
                          ]),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            try {
                              if (_regFormKey.currentState.validate()) {
                                setState(() {
                                  showSpinner = true;
                                });
                                if (password == confirmpassword) {
                                  final newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  loggedUser = newUser.user;
                                  _firestore.collection("Lab Info").add({
                                    'name': name,
                                    'email': email,
                                    'phone': phno,
                                    'address': address,
                                    'timeslots available': timeslots,
                                    'password': password,
                                    'confirmpassword': confirmpassword,
                                    'id': loggedUser.uid
                                  });

                                  if (newUser != null) {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        LoginScreen.id, (route) => true);
                                  }

                                  setState(() {
                                    showSpinner = false;
                                  });
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Error"),
                                          content: Text(
                                              "The passwords do not match"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text("Close"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  showSpinner = false;
                                                });
                                              },
                                            )
                                          ],
                                        );
                                      });
                                }
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Center(
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins-Bold",
                                  fontSize: 15,
                                  letterSpacing: 0.4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
