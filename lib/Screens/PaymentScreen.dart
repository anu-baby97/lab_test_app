import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_test_booking_app/Screens/HomeScreen.dart';
import 'package:lab_test_booking_app/Screens/LabInfo.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = "Payment Screen";
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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

  @override
  initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            content: new Text('Do you want to cancel the appointment?',
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 16,
                    color: Colors.cyan.shade700)),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.popAndPushNamed(context, HomeScreen.id),
                child: Text("YES",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: 15,
                        color: Colors.cyan.shade700)),
              ),
              SizedBox(height: 10),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: 15,
                        color: Colors.cyan.shade700)),
              ),
            ],
          ),
        ) ??
        false;
  }

  String PaymentOptionSelected;
  bool showSpinner = false;
  List PaymentOptions = ["Net Banking", "Debit/Credit Card", "UPI", "Wallet"];
  Widget addRadioButton(int btnValue, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18, fontFamily: "Poppins-Medium"),
          ),
          Flexible(child: SizedBox(width: double.infinity)),
          Radio(
            splashRadius: 10,
            activeColor: Theme.of(context).primaryColor,
            value: PaymentOptions[btnValue],
            groupValue: PaymentOptionSelected,
            onChanged: (value) {
              setState(() {
                print(value);
                PaymentOptionSelected = value;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyan.shade50,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            shadowColor: Colors.cyan.shade300,
            backwardsCompatibility: false,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(360)),
            title: Text(
              "PAYMENT",
              style: TextStyle(color: Colors.blue.shade300),
            ),
            leading: Icon(
              Icons.payments,
              color: Colors.blue.shade300,
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    backgroundColor: Colors.cyan.shade100,
                    title: new Text(
                      'Booking Successful!',
                      style:
                          TextStyle(fontFamily: "Poppins-Medium", fontSize: 20),
                    ),
                    actions: <Widget>[
                      new GestureDetector(
                        onTap: () {
                Navigator.popAndPushNamed(context, HomeScreen.id);
                _firestore
                    .collection("Appointments Completed")
                    .doc(loggedInUser.uid).collection("Status").add({
                  'Status':"Booked"
                });

                },
                        child: Text("OK     ",
                            style: TextStyle(
                                fontFamily: "Poppins-Medium",
                                fontSize: 20,
                                color: Colors.cyan)),
                      ),
                    ],
                  ),
                );
              },
              label: Text(
                "PAY",
                style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    color: Colors.white,
                    fontSize: 20),
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: 5,
                        ),
                        Column(children: [
                          Container(
                            decoration: buildBoxDecoration(),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_business_outlined,
                                  color: Colors.black,
                                ),
                                Expanded(
                                    child: addRadioButton(0, "NET BANKING")),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: buildBoxDecoration(),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.payment_outlined,
                                  color: Colors.black,
                                ),
                                Expanded(
                                    child:
                                        addRadioButton(1, "CREDIT/DEBIT CARD")),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                              padding: EdgeInsets.all(8),
                              decoration: buildBoxDecoration(),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.system_update_alt,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                      child: addRadioButton(
                                          2, "PHONEPE/GOOGLE PAY/UPI")),
                                ],
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                              padding: EdgeInsets.all(8),
                              decoration: buildBoxDecoration(),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.account_balance_wallet_outlined,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                      child: addRadioButton(
                                          3, "PAYTM/PAYZAPP/WALLETS")),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ]),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}
