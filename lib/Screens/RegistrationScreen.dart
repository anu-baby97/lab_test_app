import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_test_booking_app/Screens/LoginScreen.dart';
import 'package:lab_test_booking_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "RegistrationScreen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool showSpinner = false;
  String name;
  String email;
  String dob;
  String phno;
  String genderSelect;
  String address;
  String uname;
  String password;
  String confirmpassword;

  List gender = ["Male", "Female", "Other"];

  Widget addRadioButton(int btnValue, String title) {
    return Row(
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: genderSelect,
          onChanged: (value) {
            setState(() {
              print(value);
              genderSelect = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  final GlobalKey<FormState> _regFormKey = GlobalKey<FormState>();

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  DateTime selectedDate = DateTime.now();

  TextEditingController _date = new TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1901),
      lastDate: DateTime(2100),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;

        _date.value = TextEditingValue(text: picked.toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0XFFB9D9E8),
            title: Text('Registration Page', style: TextStyle(fontSize: 20)),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            )),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image_02.png'),
                    fit: BoxFit.fitWidth),
                color: Colors.white,
              ),
              child: Form(
                key: _regFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                      child: Column(
                        children: [
                          TextFormField(
                            autofocus: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Enter Name",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15.0)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                        child: TextFormField(
                          validator: emailValidator,
                          onChanged: (value) {
                            email = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.0)),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                        child: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: _date,
                              onChanged: (value) {
                                dob = value;
                              },
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  labelText: 'Enter Date of Birth',
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  prefixIcon: Icon(Icons.calendar_today)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value.length < 10 || value.length > 10) {
                              return 'Phone number invalid';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            phno = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              prefixText: "      +91 ",
                              prefixStyle: TextStyle(
                                color: Colors.black,
                              ),
                              hintText: "Enter Phone Number",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.0)),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 40, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enter Gender",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Row(
                              children: <Widget>[
                                addRadioButton(0, 'Male'),
                                addRadioButton(1, 'Female'),
                                addRadioButton(2, 'Others'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 80, 0),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            address = value;
                          },
                          maxLines: 3,
                          decoration: InputDecoration(
                              hintText: "Enter Address",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.0)),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            uname = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Username",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.0)),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value.length < 8) {
                              return 'Password must be longer than 8 characters';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.0)),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 80, 10),
                        child: TextField(
                          onChanged: (value) {
                            confirmpassword = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Re-enter Password",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                            //contentPadding: EdgeInsets.all(10)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(80),
                    ),
                    InkWell(
                      child: Container(
                        width: ScreenUtil.getInstance().setWidth(900),
                        height: ScreenUtil.getInstance().setHeight(100),
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
                              _firestore.collection("patients").add({
                                'name': name,
                                'email': email,
                                'dob': dob,
                                'phone': phno,
                                'gender': genderSelect,
                                'address': address,
                                'username': uname,
                                'password': password,
                                'confirmpassword': confirmpassword,
                              });

                              try {
                                if (_regFormKey.currentState.validate()) {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  if (password == confirmpassword) {
                                    final newUser = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);
                                    if (newUser != null) {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          LoginScreen.id, (route) => true);
                                    }

                                    setState(() {
                                      showSpinner = false;
                                    });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Error"),
                                            content: Text(
                                                "The passwords do not match"),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text("Close"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  setState(() {
                                                    showSpinner = false;
                                                  });
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  }
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Center(
                              child: Text(
                                "REGISTER",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 15,
                                    letterSpacing: 0.4),
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
          ),
        ),
      ),
    );
  }
}
