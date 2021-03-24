import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab_test_booking_app/Screens/LabLogin.dart';
import 'package:lab_test_booking_app/Services/authServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LabInfo1 extends StatefulWidget {
  static const String id = "LabInfoScreen";
  @override
  _LabInfo1State createState() => _LabInfo1State();
}

class _LabInfo1State extends State<LabInfo1> {
  bool _isChecked = false;

  TextEditingController controller;
  final _firestore = FirebaseFirestore.instance;
  String labSelect;
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
    /* _firestore
        .collection("Lab Names").add(
        {'Lab Names': labNames

        });*/
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SafeArea(
          child: CustomScrollView(slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.white,
              expandedHeight: 65,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                background: TextField(
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.center,
                    onChanged: (value) {},
                    decoration: buildLocationInputDecoration()),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('Lab Info').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            decoration: buildBoxDecoration(),
                            child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RadioListTile(
                            groupValue: document["Lab Name"],
                            tileColor: Colors.white,

                            /*selectedTileColor:
                                              Colors.cyan.shade200,*/

                            //autofocus: true,
                            activeColor: Theme.of(context).primaryColor,
                            value: document["Lab Name"],
                            onChanged: (value) {
                              setState(() {
                                labSelect = value;
                              });
                            },
                            title: ListTile(
                              title: Text(document["Lab Name"],style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontFamily: "Poppins-Bold",
                                  letterSpacing: .6)),
                            ),
                            subtitle: ListTile(
                                title: Text(
                                    document["Address"]),
                                leading: Icon(Icons.location_city)),
                          ),
                        ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  InputDecoration buildLocationInputDecoration() {
    return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Icon(
          Icons.search,
          color: Colors.cyan,
        ),
      ),
      hintText: 'Search for the Laboratory',
      hintStyle: TextStyle(
          fontFamily: "Lobster-Regular", color: Colors.grey, fontSize: 21),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.cyan.shade100,
              offset: Offset(0.0, 0.0),
              blurRadius: 15.0),
          BoxShadow(
              color: Colors.cyan.shade100,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0),
        ]);
  }
}
