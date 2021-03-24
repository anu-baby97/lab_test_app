import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab_test_booking_app/Screens/AppointmentInfo.dart';
import 'package:lab_test_booking_app/Screens/TestInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookingScreen extends StatefulWidget {
  static const String id = "BookingScreen";

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate;
  DateTime selectedTime;
  DateTime initialTime;
  DateTime now;
  final _firestore = FirebaseFirestore.instance;
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

  List<DateTime> dateList = List();
  List<DateTime> timeSlotList = List();

  @override
  void initState() {
    getCurrentUser();
    now = DateTime.now();
    selectedDate = now;
    initialTime = DateTime(now.year, now.month, now.day, 9, 30);
    for (var i = 0; i < 10; i++) {
      dateList.add(now.add(Duration(days: i)));
    }
    for (var i = 0; i < 13; i++) {
      timeSlotList.add(initialTime.add(Duration(minutes: i * 30)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade200,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.book_online_outlined),
        title: Text(
          "Book Your Slot Here",
          style: TextStyle(fontSize: 23, fontFamily: 'Poppins-Medium'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              _firestore
                  .collection("Appointments Summary")
                  .doc(loggedInUser.email)
                  .set({
                'Date and Time': selectedTime.toString(),
              });
              _firestore
                  .collection("Appointments Completed")
                  .doc(loggedInUser.uid)
                  .collection("Selected Booking Slot")
                  .add({
                'Date and Time': selectedTime.toString(),
              });
              Navigator.pushNamedAndRemoveUntil(
                  context, AppointmentInfo.id, (route) => true);
            });
          },
          label: Text(
            "Confirm",
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                color: Colors.white,
                fontSize: 20),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
                child: Text(
                  "Select Date",
                  style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 23),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var _date in dateList)
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              selectedDate = _date;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: selectedDate != null &&
                                          selectedDate == _date
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius:
                                            selectedDate == _date ? 0 : 5.0),
                                    BoxShadow(
                                        color: Colors.grey.shade500,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius:
                                            selectedDate == _date ? 0 : 5.0),
                                  ]),
                              child: addBookingDate(_date)),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 10),
                          child: Text(
                            "Select Time",
                            style: TextStyle(
                                fontFamily: "Poppins-Bold", fontSize: 23),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Wrap(
                        runSpacing: 15.0,
                        children: [
                          for (var _timeSlot in timeSlotList)
                            addTimeSlot(DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                _timeSlot.hour,
                                _timeSlot.minute))
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addBookingDate(DateTime _date) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        children: [
          Text(
            _date.day.toString(),
            style: TextStyle(
                color: _date == selectedDate ? Colors.white : Colors.black,
                fontFamily: "Poppins-Medium",
                fontSize: 25),
          ),
          Text(getMonth(_date),
              style: TextStyle(
                  color: _date == selectedDate ? Colors.white : Colors.black,
                  fontFamily: "Poppins-Medium",
                  fontSize: 20)),
          Text(_date.year.toString(),
              style: TextStyle(
                  color: _date == selectedDate ? Colors.white : Colors.black,
                  fontFamily: "Poppins-Medium",
                  fontSize: 20))
        ],
      ),
    );
  }

  Widget addTimeSlot(DateTime _time) {
    return InkWell(
      onTap: () async {
        if (_time.isAfter(now)) {
          setState(() {
            selectedTime = _time;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: selectedTime == _time ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: selectedTime == _time
                      ? Colors.transparent
                      : Colors.grey.shade200,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 15.0),
              BoxShadow(
                  color: selectedTime == _time
                      ? Colors.transparent
                      : Colors.grey.shade500,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0),
            ]),
        width: 107,
        height: 60,
        margin: EdgeInsets.only(right: 15),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Center(
                child: Text(
                  (_time.hour.toString()) +
                      ":" +
                      (('0' + _time.minute.toString()).substring(
                          _time.minute.toString().length - 1,
                          _time.minute.toString().length + 1)),
                  style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 20,
                    color: _time.isBefore(now)
                        ? Colors.grey
                        : selectedTime == _time
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
              ),
              //_time.hour<12?Text("  AM"):Text("  PM"),
            ],
          ),
        ),
      ),
    );
  }

  getMonth(DateTime time) {
    return new DateFormat('MMM').format(time);
  }
}
