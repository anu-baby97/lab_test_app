import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_test_booking_app/Screens/PaymentScreen.dart';

class ViewAppointment extends StatefulWidget {
  static const String id = "ViewAppointment";
  @override
  _ViewAppointmentState createState() => _ViewAppointmentState();
}

//final _firestore = FirebaseFirestore.instance;
var firebaseUser = FirebaseAuth.instance.currentUser;
final _auth = FirebaseAuth.instance;

class _ViewAppointmentState extends State<ViewAppointment> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Appointment Details",
          style: TextStyle(fontFamily: 'Poppins-Medium'),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Appointments Completed')
                      .doc(loggedInUser.uid)
                      .collection("Selected Test")
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
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Appointments Completed')
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
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Appointments Completed')
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
                            leading: Text("Fees: ",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),
                            title: Text(document["Fees"].toString()),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Appointments Completed')
                      .doc(loggedInUser.uid)
                      .collection("Selected Booking Slot")
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
                            leading: Text("Date and Time: ",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),
                            title: Text(document["Date and Time"].toString()),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Appointments Completed')
                      .doc(loggedInUser.uid)
                      .collection("Status")
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
                            leading: Icon(Icons.assignment_turned_in_outlined,color:Colors.cyan.shade300),
                            title:  Text(document["Status"].toString(),
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 17)),

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
