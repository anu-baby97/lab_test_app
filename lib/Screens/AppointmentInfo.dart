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
  /*void getDetails() async {
    await _firestore.collection("appointments").snapshots().listen((result) {
      result.docs.forEach((result) {
        print(result.data());
      });
    });
  }*/

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
          children: [
            MessagesStream(),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('appointments').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final details = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var detail in details) {
          final detailsText = detail.data().toString();
          final user = detail.data().toString();

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: user,
            text: detailsText,
            isMe: currentUser == user,
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0), color: Colors.cyan.shade200),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontFamily: "Poppins-Medium",
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
