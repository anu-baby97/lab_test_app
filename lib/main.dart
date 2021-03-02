import 'package:flutter/material.dart';
import 'package:lab_test_booking_app/Screens/AdminLogin.dart';
import 'package:lab_test_booking_app/Screens/AppointmentInfo.dart';
import 'package:lab_test_booking_app/Screens/BookingScreen.dart';
import 'package:lab_test_booking_app/Screens/Forgot Password.dart';
import 'package:lab_test_booking_app/Screens/LabInfo.dart';
import 'package:lab_test_booking_app/Screens/LoginScreen.dart';
import 'package:lab_test_booking_app/Screens/PaymentScreen.dart';
import 'package:lab_test_booking_app/Screens/RegistrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab_test_booking_app/Screens/TestInfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Patient Portal",
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LabInfo.id: (context) => LabInfo(),
        TestInfo.id: (context) => TestInfo(),
        ForgotPassword.id: (context) => ForgotPassword(),

        BookingScreen.id: (context) => BookingScreen(),
        AppointmentInfo.id: (context) => AppointmentInfo(),
        PaymentScreen.id: (context) => PaymentScreen(),
        AdminLogin.id: (context) => AdminLogin(),
      },
    );
  }
}
