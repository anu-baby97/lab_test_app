import 'package:flutter/material.dart';

class LabInfo extends StatefulWidget {
  static const String id = "LabInfoScreen";
  @override
  _LabInfoState createState() => _LabInfoState();
}

class _LabInfoState extends State<LabInfo> {
  /*final _auth = FirebaseAuth.instance;
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
*/
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0XFFB9D9E8),
      body: Container(),
    );
  }
}
