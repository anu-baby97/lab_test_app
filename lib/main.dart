import 'package:flutter/material.dart';
import 'package:lab_test_booking_app/Screens/Forgot%20Password.dart';
import 'package:lab_test_booking_app/Screens/LabInfo.dart';
import 'package:lab_test_booking_app/Screens/LoginScreen.dart';
import 'package:lab_test_booking_app/Screens/RegistrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';

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
        ForgotPassword.id: (context) => ForgotPassword(),
      },
    );
  }
}
