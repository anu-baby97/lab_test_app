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

class _ViewAppointmentState extends State<ViewAppointment> {

  DocumentSnapshot documentSnapshot;
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
  Type type=Future;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Your Appointments",
          style: TextStyle(fontFamily: 'Poppins-Medium'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
           height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
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
                      int length=snapshot.data.docs.length;

                      return new Column(
                          children:
                          [
                            Expanded(
                              child: Card(
                                child: ListTile(
                                  leading: Text("Test Name: ",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontSize: 17)),
                                  title: Text(
                                      snapshot.data.docs[0]["Test Name"].toString()),
                                ),
                              ),
                            ),

                          ]
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

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        int length = snapshot.data.docs.length;

                        return new Column(
                            children:
                            [
                              Expanded(
                                child: Card(
                                  child: ListTile(
                                    leading: Text("Lab Name: ",
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 17)),
                                    title: Text(
                                        snapshot.data
                                            .docs[0]["Selected Laboratory"]
                                            .toString()),
                                  ),
                                ),
                              ),

                            ]
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
                      int length=snapshot.data.docs.length;
                      return new Column(
                          children:
                          [
                            Expanded(
                              child: Card(
                                child: ListTile(
                                  leading: Text("Fees: ",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontSize: 17)),
                                  title: Text(
                                      snapshot.data.docs[0]["Fees"].toString()),
                                ),
                              ),
                            ),

                          ]
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
                      int length=snapshot.data.docs.length;
                      return new Column(
                          children:
                          [
                            Expanded(
                              child: Card(
                                child: ListTile(
                                  leading: Text("Booked Slot: ",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontSize: 17)),
                                  title: Text(
                                      snapshot.data.docs[0]["Date and Time"].toString()),
                                ),
                              ),
                            ),

                          ]
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
                      int length=snapshot.data.docs.length;
                      return new Column(
                          children:
                          [
                            Expanded(
                              child: Card(
                                child: ListTile(
                                  leading: Icon(Icons.assignment_turned_in_outlined,color:Colors.cyan.shade300),
                                  title:  Text(snapshot.data.docs[0]["Status"].toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontSize: 17)),
                                ),
                              ),
                            ),

                          ]
                      );
                    },
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.cyan.shade200,
                ),
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
try {
  return new Column(
      children:
      [
        Expanded(
          child: Card(
            child: ListTile(
              leading: Text("Test Name: ",
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 17)),
              title: Text(
                  snapshot.data.docs[1]["Test Name"].toString()),
            ),
          ),
        ),

      ]
  );
}
                      catch(e){
                        return Text("");
                      }
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
try {
  return new Column(
      children:
      [
        Expanded(
          child: Card(
            child: ListTile(
              leading: Text("Lab Name: ",
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 17)),
              title: Text(
                  snapshot.data.docs[1]["Selected Laboratory"].toString()),
            ),
          ),
        ),

      ]
  );
}
catch(e){
  return Text("");
}
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
try {
  return new Column(
      children:
      [
        Expanded(
          child: Card(
            child: ListTile(
              leading: Text("Fees: ",
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 17)),
              title: Text(
                  snapshot.data.docs[1]["Fees"].toString()),
            ),
          ),
        ),

      ]
  );
}
catch(e){
  return Text("");
}
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
try {
  return new Column(
      children:
      [
        Expanded(
          child: Card(
            child: ListTile(
              leading: Text("Booked Slot: ",
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 17)),
              title: Text(
                  snapshot.data.docs[1]["Date and Time"].toString()),
            ),
          ),
        ),

      ]
  );
}
catch(e){
  return Text("");
}
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
try {
  return new Column(
      children:
      [
        Expanded(
          child: Card(
            child: ListTile(
              leading: Icon(Icons.assignment_turned_in_outlined,
                  color: Colors.cyan.shade300),
              title: Text(snapshot.data.docs[1]["Status"].toString(),
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 17)),
            ),
          ),
        ),

      ]
  );
}
catch(e){
  return Text("");
}
                    },
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
