import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_test_booking_app/Screens/AppointmentInfo.dart';
import 'package:lab_test_booking_app/Screens/TestInfo.dart';
import 'package:lab_test_booking_app/Screens/ViewAppointments.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF6078ea).withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0)
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          Navigator.pushNamedAndRemoveUntil(
                              context, TestInfo.id, (route) => true);
                        });
                      },
                      child: Center(
                        child: Text(
                          "BOOK FOR A TEST",
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
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF6078ea).withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0)
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          Navigator.pushNamedAndRemoveUntil(
                              context, ViewAppointment.id, (route) => true);
                        });
                      },
                      child: Center(
                        child: Text(
                          "VIEW APPOINTMENTS",
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
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF6078ea).withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0)
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppointmentInfo.id, (route) => true);
                        });
                      },
                      child: Center(
                        child: Text(
                          "VIEW REPORT",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
