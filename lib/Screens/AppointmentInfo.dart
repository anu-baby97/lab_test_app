import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_test_booking_app/Screens/PaymentScreen.dart';
import 'dart:io';

class AppointmentInfo extends StatefulWidget {
  static const String id = "AppointmentInfo";
  @override
  _AppointmentInfoState createState() => _AppointmentInfoState();
}

class _AppointmentInfoState extends State<AppointmentInfo> {
  List properties = ["Test Name", ""];
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
  // final DocumentSnapshot documentSnapshot=await FirebaseFirestore.instance.collection("Appointment Summary").doc(loggedInUser.uid).get();

  @override
  initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }
  // CollectionReference appointmentDetails=FirebaseFirestore.instance.collection("Appointment Summary");
  //
  //
  // Future<void> deleteUser()async {
  // return appointmentDetails
  //       .doc(loggedInUser.uid)
  //       .delete()
  //       .then((value) => print("User Deleted"))
  //       .catchError((error) => print("Failed to delete user: $error"));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              try {
                FirebaseFirestore.instance
                    .collection("Appointments Summary")
                    .doc("Selected Test")
                    .delete()
                    .then((value) => print("User Deleted"))
                    .catchError((error) =>
                    print("Failed to delete user: $error"));
                FirebaseFirestore.instance
                    .collection("Appointments Summary")
                    .doc("Selected Laboratory")
                    .delete()
                    .then((value) => print("User Deleted"))
                    .catchError((error) =>
                    print("Failed to delete user: $error"));
                FirebaseFirestore.instance
                    .collection("Appointments Summary")
                    .doc("Selected Booking Slot")
                    .delete()
                    .then((value) => print("User Deleted"))
                    .catchError((error) =>
                    print("Failed to delete user: $error"));
                FirebaseFirestore.instance
                    .collection("Appointments Summary")
                    .doc("Fees")
                    .delete()
                    .then((value) => print("User Deleted"))
                    .catchError((error) =>
                    print("Failed to delete user: $error"));
              }
              catch(e){
                CircularProgressIndicator();
              }
            });
          },
          label: Text(
            "PLACE THE APPOINTMENT",
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                color: Colors.white,
                fontSize: 17),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Appointments Summary")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading");
                    }
                    return Column(
                      children: [
                        ListTile(
                            tileColor: Colors.cyan.shade50,
                            leading: Text("Selected Test: ",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),
                            title: Text(
                                snapshot.data.docs[3]['Test Name'].toString(), style: TextStyle(
                                fontFamily: 'Poppins-Medium', fontSize: 17))),
                        ListTile(
                            tileColor: Colors.cyan.shade100,
                            leading: Text("Selected Laboratory: ",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),
                            title: Text(snapshot
                                .data.docs[2]['Selected Laboratory']
                                .toString(), style: TextStyle(
                                fontFamily: 'Poppins-Medium', fontSize: 17)),),
                        ListTile(
                          tileColor: Colors.cyan.shade200,
                          leading: Text("Fees: ",
                              style: TextStyle(
                                  fontFamily: 'Poppins-Medium', fontSize: 17)),
                          title: Text(
                            snapshot.data.docs[0]['Fees'].toString(), style: TextStyle(
                              fontFamily: 'Poppins-Medium', fontSize: 17)
                          ),
                        ),
                        ListTile(
                            tileColor: Colors.cyan.shade300,
                            leading: Text(" Booked Slot: ",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),
                            title: Text(snapshot.data.docs[1]['Date and Time']
                                .toString(), style: TextStyle(
                                fontFamily: 'Poppins-Medium', fontSize: 17))),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
