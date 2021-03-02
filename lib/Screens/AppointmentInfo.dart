import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_test_booking_app/Screens/PaymentScreen.dart';

class AppointmentInfo extends StatefulWidget {
  static const String id = "AppointmentInfo";
  @override
  _AppointmentInfoState createState() => _AppointmentInfoState();
}

final _firestore = FirebaseFirestore.instance;
var firebaseUser = FirebaseAuth.instance.currentUser;
final _auth = FirebaseAuth.instance;
User loggedInUser;
User loggedUsersName;

class _AppointmentInfoState extends State<AppointmentInfo> {

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
    /* getDetails();*/
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        title: Text(
          "Appointment Details",
          style: TextStyle(fontFamily: 'Poppins-Medium'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              Navigator.pushNamedAndRemoveUntil(
                  context, PaymentScreen.id, (route) => true);
            });
          },
          label: Text(
            "            PAY            ",
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                color: Colors.white,
                fontSize: 20),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(

        ),
      ),
    );
  }
}

