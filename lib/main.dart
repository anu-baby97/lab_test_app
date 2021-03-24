import 'package:flutter/material.dart';
import 'package:lab_test_booking_app/Screens/AdminHomeScreen.dart';
import 'package:lab_test_booking_app/Screens/AdminLogin.dart';
import 'package:lab_test_booking_app/Screens/AppointmentInfo.dart';
import 'package:lab_test_booking_app/Screens/BookingScreen.dart';
import 'package:lab_test_booking_app/Screens/ClinicRegistration.dart';
import 'package:lab_test_booking_app/Screens/Forgot Password.dart';
import 'package:lab_test_booking_app/Screens/HomeScreen.dart';
import 'package:lab_test_booking_app/Screens/LabInfo.dart';
import 'package:lab_test_booking_app/Screens/LabInfo1.dart';
import 'package:lab_test_booking_app/Screens/LabLogin.dart';
import 'package:lab_test_booking_app/Screens/LoginScreen.dart';
import 'package:lab_test_booking_app/Screens/PaymentScreen.dart';
import 'package:lab_test_booking_app/Screens/RegistrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab_test_booking_app/Screens/TestInfo.dart';
import 'package:lab_test_booking_app/Screens/ViewAppointments.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      //don't forget to change to mediaQuery
      title: "Patient Portal",
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id:(context)=>HomeScreen(),
        LabInfo.id: (context) => LabInfo(),
        TestInfo.id: (context) => TestInfo(),
        ForgotPassword.id: (context) => ForgotPassword(),
        BookingScreen.id: (context) => BookingScreen(),
        AppointmentInfo.id: (context) => AppointmentInfo(),
        PaymentScreen.id: (context) => PaymentScreen(),
        AdminLogin.id: (context) => AdminLogin(),
        ViewAppointment.id: (context) => ViewAppointment(),
        AdminHomeScreen.id:(context)=> AdminHomeScreen(),
        ClinicRegistrationScreen.id:(context)=> ClinicRegistrationScreen(),
        LabLogin.id:(context)=> LabLogin(),
        LabInfo1.id:(context)=> LabInfo1(),

      },
    );
  }
}
