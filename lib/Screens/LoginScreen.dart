import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_test_booking_app/Screens/AdminLogin.dart';
import 'package:lab_test_booking_app/Screens/HomeScreen.dart';
import 'package:lab_test_booking_app/Services/authServices.dart';
import 'package:lab_test_booking_app/Widgets/ProviderWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:lab_test_booking_app/Screens/RegistrationScreen.dart';
import 'package:lab_test_booking_app/Screens/Forgot Password.dart';
import 'package:lab_test_booking_app/Screens/TestInfo.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  //final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

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

  AnimationController controller;
  AnimationController controller1;
  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
      upperBound: 40,
    );
    AnimationController(duration: Duration(seconds: 2), vsync: this);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    controller1 = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 22,
    );
    AnimationController(duration: Duration(seconds: 1), vsync: this);
    controller1.forward();
    controller1.addListener(() {
      setState(() {});
    });
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

  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: new Scaffold(
          backgroundColor: Color(0XFFB9D9E8),
          appBar: AppBar(
            backgroundColor: Color(0XFFF1F7F8),
            iconTheme: IconThemeData(color: Colors.teal),
          ),
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
                        color: Color(0XFFF1F7F8),
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        height: controller.value,
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/logo.png",
                              width: controller.value,
                              height: controller.value,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("MEDICOS LAB BOOKING",
                                style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: controller1.value,
                                    fontFamily: "Poppins-Bold",
                                    letterSpacing: .6,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/clinic.png",
                        //fit: BoxFit.fitWidth,
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
                            SizedBox(height: 290),
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                ForgotPassword.id,
                                                (route) => true);
                                          },
                                          child: Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontFamily: "Poppins-Medium",
                                                fontSize:
                                                    ScreenUtil.getInstance()
                                                        .setSp(40)),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                height: ScreenUtil.getInstance().setHeight(40)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 12.0,
                                    ),
                                    GestureDetector(
                                      onTap: _radio,
                                      child: radioButton(_isSelected),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text("Remember me",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Poppins-Medium"))
                                  ],
                                ),
                                SizedBox(height: 10),
                                InkWell(
                                  child: Container(
                                    width:
                                        ScreenUtil.getInstance().setWidth(330),
                                    height:
                                        ScreenUtil.getInstance().setHeight(100),
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

                                              final user = await AuthService()
                                                  .signInWithEmailAndPassword(
                                                      email, password);
                                              if (user != null) {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        HomeScreen.id,
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
                                                            _controller.clear();
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
                                                        child: Text("Try Again",
                                                            style: TextStyle(
                                                                fontSize: 15)),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {
                                                            showSpinner = false;
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
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(40),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                horizontalLine(),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "New User? ",
                                  style:
                                      TextStyle(fontFamily: "Poppins-Medium"),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        RegistrationScreen.id, (route) => true);
                                  },
                                  child: Text("Sign Up",
                                      style: TextStyle(
                                          color: Color(0xFF5d74e3),
                                          fontFamily: "Poppins-Bold")),
                                )
                              ],
                            ),
                          ],
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
