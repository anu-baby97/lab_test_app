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
          onPressed: (){
            setState((){
              FirebaseFirestore.instance.collection("Appointments Summary").doc(loggedInUser.uid).delete().then((value) => print("User Deleted"))
                  .catchError((error) => print("Failed to delete user: $error"));
              Navigator.pushNamedAndRemoveUntil(
                  context, PaymentScreen.id, (route) => true);
              FirebaseFirestore.instance.collection("Appointments Summary").doc(loggedInUser.email).delete().then((value) => print("User Deleted"))
                  .catchError((error) => print("Failed to delete user: $error"));
              Navigator.pushNamedAndRemoveUntil(
                  context, PaymentScreen.id, (route) => true);

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
              SizedBox(
                height: 60,
                child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Appointments Summary').doc(loggedInUser.uid).snapshots(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return new ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return Card(
                          child: ListTile(
                            tileColor: Colors.cyan.shade100,
                            leading: Text("Test Name: ",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),
                            title: Text(document["Test Name"].toString()),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 60,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Appointments Summary')
                      .doc(loggedInUser.uid)
                      .collection("Laboratory Selected")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return new ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return Card(
                          child: ListTile(
                            tileColor: Colors.cyan.shade200,
                            leading: Text("Lab Name: ",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),
                            title: Text(
                                document["Selected Laboratory"].toString()),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
             SizedBox(
              height: 60,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Appointments Summary')
                      .doc(loggedInUser.uid)
                      .collection("Fees")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return new ListView(
                      children:
                      snapshot.data.docs.map((DocumentSnapshot document) {
                        return Card(
                          child: ListTile(
                            tileColor: Colors.cyan.shade300,
                            leading: Text("Fees: ",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),
                            title:
                            Text(document["Fees"].toString()),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 60,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Appointments Summary').where("Date and Time")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return new ListView(
                      children:
                      snapshot.data.docs.map((DocumentSnapshot document) {
                        return Card(
                          child: ListTile(
                            tileColor: Colors.cyan.shade400,
                            leading: Text("Date and Time: ",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),
                            title:
                            Text(document["Date and Time"].toString()),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
