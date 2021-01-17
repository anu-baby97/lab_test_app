import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lab1 extends StatefulWidget {
  @override
  _Lab1State createState() => _Lab1State();
  static const String id = 'Lab 1';
}

class _Lab1State extends State<Lab1> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(highlightColor: Colors.cyan.shade500),
      child: Scaffold(
        backgroundColor: Colors.cyan.shade100,
        body: SafeArea(
          child: Scrollbar(
            thickness: 10,
            radius: Radius.circular(50),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ListTile(
                        title: Text("Saroj Diagonistic Laboratory",
                            style: TextStyle(
                                fontFamily: 'Poppins-Bold', fontSize: 25)),
                        leading: Icon(
                          Icons.local_hospital,
                          color: Colors.red.shade400,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ListTile(
                        title: Text(
                            "Olive Arcade, Junction, Malaparamba, Kozhikode, Kerala 673009",
                            style: TextStyle(
                                fontFamily: 'Poppins-Medium', fontSize: 15)),
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.red.shade400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.cyan.shade200,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: CustomScrollView(slivers: [
                          SliverAppBar(
                            title: Text(
                              "Available Tests",
                              style: TextStyle(color: Colors.cyan.shade800),
                            ),
                            pinned: true,
                            backgroundColor: Colors.cyan.shade200,
                          ),
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  title: Text("Covid-19"),
                                  trailing: Checkbox(
                                      value: false,
                                      onChanged: (value) {
                                        value = true;
                                      }),
                                ),
                                ListTile(
                                  title: Text("Blood Test"),
                                  trailing: Checkbox(value: false),
                                ),
                                ListTile(
                                  title: Text("ECG"),
                                  trailing: Checkbox(value: false),
                                ),
                                ListTile(
                                  title: Text("ECG"),
                                  trailing: Checkbox(
                                      value: false,
                                      onChanged: (value) {
                                        value = true;
                                      }),
                                ),
                                ListTile(
                                  title: Text("ECG"),
                                  trailing: Checkbox(value: false),
                                ),
                                ListTile(
                                  title: Text("ECG"),
                                  trailing: Checkbox(value: false),
                                ),
                                ListTile(
                                  title: Text("ECG"),
                                  trailing: Checkbox(value: false),
                                ),
                                ListTile(
                                  title: Text("ECG"),
                                  trailing: Checkbox(value: false),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.cyan.shade200,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: CustomScrollView(slivers: [
                          SliverAppBar(
                            title: Text(
                              "Available Services",
                              style: TextStyle(color: Colors.cyan.shade800),
                            ),
                            pinned: true,
                            backgroundColor: Colors.cyan.shade200,
                          ),
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  title: Text("Online Test Booking"),
                                  trailing: Checkbox(
                                      value: false,
                                      onChanged: (value) {
                                        value = true;
                                      }),
                                ),
                                ListTile(
                                  title: Text("Home Checkup"),
                                  trailing: Checkbox(value: false),
                                ),
                                ListTile(
                                  title: Text("Pharmacy"),
                                  trailing: Checkbox(value: false),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Center(
                      child: RaisedButton(
                        highlightColor: Colors.cyan,
                        focusColor: Colors.cyan.shade200,
                        color: Colors.cyan.shade100,
                        textColor: Colors.black,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.red,
                        splashColor: Colors.cyan.shade200,
                        onPressed: () {},
                        child: Text("NEXT"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
