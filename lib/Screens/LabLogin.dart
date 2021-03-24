import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_test_booking_app/Screens/AdminHomeScreen.dart';
import 'package:lab_test_booking_app/Screens/AdminLogin.dart';
import 'package:lab_test_booking_app/Screens/LabInfo1.dart';
import 'package:lab_test_booking_app/Screens/LoginScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:lab_test_booking_app/Services/authServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LabLogin extends StatefulWidget {
  static const String id = "LabLogin";
  @override
  _LabLoginState createState() => _LabLoginState();
}

class _LabLoginState extends State<LabLogin> {
  final _auth = FirebaseAuth.instance;
  User loggedUser;
  final _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String email;
  String password;
  String id;
  bool showSpinner = false;
List ts=["9.30","10.00"];
  Future<String> getCurrentUIDofLab(User user) async {
    return (loggedUser.uid);
  }

@override
initState() {
  super.initState();
  getCurrentUIDofLab(loggedUser);
}

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(
              'Are you sure?',
              style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 16),
            ),
            content: new Text('Do you want to exit the App',
                style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 16)),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES",
                    style:
                        TextStyle(fontFamily: "Poppins-Medium", fontSize: 15)),
              ),
              SizedBox(height: 10),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO",
                    style:
                        TextStyle(fontFamily: "Poppins-Medium", fontSize: 15)),
              ),
            ],
          ),
        ) ??
        false;
  }

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();

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
    if (value.length < 6) {
      return 'Password must be longer than 6 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: new Scaffold(
          backgroundColor: Colors.cyan.shade50,
          appBar: AppBar(backgroundColor: Colors.cyan.shade50),
          drawer: Drawer(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text("Patient"),
                leading: Icon(Icons.person),
                onTap: () {
                  setState(() {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.id, (route) => true);
                  });
                },
              ),
              ListTile(
                title: Text("Admin"),
                leading: Icon(Icons.supervisor_account),
                onTap: () {
                  setState(() {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AdminLogin.id, (route) => true);
                  });
                },
              ),
              ListTile(
                title: Text("Clinic"),
                leading: Icon(Icons.supervisor_account),
                onTap: () {
                  setState(() {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LabLogin.id, (route) => true);
                  });
                },
              )
            ],
          )),
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        color: Colors.cyan.shade50,
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text("MEDICOS LAB BOOKING",
                                style: TextStyle(
                                    color: Colors.cyan,
                                    fontFamily: "Poppins-Bold",
                                    letterSpacing: .6,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 28.0, right: 28.0),
                      child: Form(
                        key: _loginFormKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0.0, 15.0),
                                        blurRadius: 15.0),
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0.0, -10.0),
                                        blurRadius: 10.0),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Login",
                                        style: TextStyle(
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(65),
                                            fontFamily: "Poppins-Bold",
                                            letterSpacing: .6)),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
                                    ),
                                    Text("Email",
                                        style: TextStyle(
                                            fontFamily: "Poppins-Medium",
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(45))),
                                    TextFormField(
                                      controller: _controller,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: emailValidator,
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Enter Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.0)),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
                                    ),
                                    Text("Password",
                                        style: TextStyle(
                                            fontFamily: "Poppins-Medium",
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(45))),
                                    TextFormField(
                                      controller: _controller1,
                                      validator: pwdValidator,
                                      onChanged: (value) {
                                        password = value;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: "Enter Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.0)),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(35),
                                    ),
                                    SizedBox(height: 10),
                                    InkWell(
                                      child: Container(
                                        width: ScreenUtil.getInstance()
                                            .setWidth(330),
                                        height: ScreenUtil.getInstance()
                                            .setHeight(100),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color(0xFF17ead9),
                                              Color(0xFF6078ea)
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0xFF6078ea)
                                                      .withOpacity(.3),
                                                  offset: Offset(0.0, 8.0),
                                                  blurRadius: 8.0)
                                            ]),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              try {
                                                if (_loginFormKey.currentState
                                                    .validate()) {
                                                  setState(() {
                                                    showSpinner = true;
                                                  });
                                                  final user = await _auth
                                                      .signInWithEmailAndPassword(
                                                          email: email,
                                                          password: password);
                                                  loggedUser = user.user;
                                                  getCurrentUIDofLab(loggedUser);

                                                  if (user != null) {
                                                    Navigator
                                                        .pushNamedAndRemoveUntil(
                                                            context,
                                                            LabInfo1.id,
                                                            (route) => true);
                                                    _controller.clear();
                                                    _controller1.clear();
                                                  }
                                                  setState(() {
                                                    showSpinner = false;
                                                  });
                                                } else {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Center(
                                                            child: Text(
                                                              "Username or Password is Incorrect",
                                                              style: TextStyle(
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: Text(
                                                                  "Try Again",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15)),
                                                              onPressed: () {
                                                                _controller
                                                                    .clear();
                                                                _controller1
                                                                    .clear();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                setState(() {
                                                                  showSpinner =
                                                                      false;
                                                                });
                                                              },
                                                            )
                                                          ],
                                                        );
                                                      });
                                                }
                                              } catch (e) {
                                                print(e);
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Center(
                                                          child: Text(
                                                            "Username or Password is Incorrect",
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: Text(
                                                                "Try Again",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15)),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              setState(() {
                                                                showSpinner =
                                                                    false;
                                                              });
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    });
                                              }
                                            },
                                            child: Center(
                                              child: Text(
                                                "SIGN IN",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Poppins-Bold",
                                                    fontSize: 18,
                                                    letterSpacing: 1.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
