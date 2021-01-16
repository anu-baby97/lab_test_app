import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_test_booking_app/Screens/Lab1.dart';

class LabInfo extends StatefulWidget {
  static const String id = "LabInfoScreen";
  @override
  _LabInfoState createState() => _LabInfoState();
}

class _LabInfoState extends State<LabInfo> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0XFFB9D9E8),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: new Icon(Icons.arrow_back),
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {},
                        decoration: buildLocationInputDecoration()),
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Saroj Diagonistic Laboratory",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_box),
                                  Text(
                                    "Covid-19 Test",
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  InkWell(
                                    child: Text(
                                      "Profile >>>",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context, Lab1.id);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("GMC Laboratory",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_box),
                                      Text(
                                        "ECG",
                                        style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.check_box),
                                      Text(
                                        "Blood Test",
                                        style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Profile >>>",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Neethi Labs and Scans",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_box),
                                      Text(
                                        "ECG",
                                        style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.check_box),
                                      Text(
                                        "Pathology Test",
                                        style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Profile >>>",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Evergreen Diagonistics",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_box),
                                      Text(
                                        "ECG",
                                        style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.check_box),
                                      Text(
                                        "Blood Test",
                                        style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.check_box),
                                      Text(
                                        "Glucose Test",
                                        style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Profile >>>",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Westhill Clinical Laboratory",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_box),
                                  Text(
                                    "Blood Test",
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Profile >>>",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Sudharma Clinical Laboratory",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_box),
                                  Text(
                                    "Blood Test",
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Profile >>>",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Sairam Clinical Laboratory",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_box),
                                  Text(
                                    "Blood Test",
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Profile >>>",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Pulse - Doctors Lab Scans",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_box),
                                  Text(
                                    "Covid-19 Test",
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Profile >>>",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Neethi Laboratory",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_box),
                                  Text(
                                    "ECG",
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Profile >>>",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildLocationInputDecoration() {
    return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Icon(Icons.search),
      ),
      hintText: 'Enter the location',
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0),
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
              color: Colors.black12,
              offset: Offset(0.0, 15.0),
              blurRadius: 15.0),
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -10.0),
              blurRadius: 10.0),
        ]);
  }
}
