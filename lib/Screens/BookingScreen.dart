import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  static const String id = "BookingScreen";
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade200,
        title: Center(
          child: Text(
            "Book Your Time Slot Here",
            style: TextStyle(fontFamily: "Lobster-Regular", fontSize: 25),
          ),
        ),
        leading: new IconButton(
          icon: new Icon(
            Icons.book_online_outlined,
            size: 30,
          ),
          color: Colors.cyan,
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: buildBoxDecoration(),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "13",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 25),
                                  ),
                                  Text("April",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20)),
                                  Text("2021",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20))
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: buildBoxDecoration(),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "14",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 25),
                                  ),
                                  Text("April",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20)),
                                  Text("2021",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20))
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: buildBoxDecoration(),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "15",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 25),
                                  ),
                                  Text("April",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20)),
                                  Text("2021",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20))
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: buildBoxDecoration(),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "16",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 25),
                                  ),
                                  Text("April",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20)),
                                  Text("2021",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20))
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: buildBoxDecoration(),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "17",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 25),
                                  ),
                                  Text("April",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20)),
                                  Text("2021",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20))
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: buildBoxDecoration(),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "18",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 25),
                                  ),
                                  Text("April",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20)),
                                  Text("2021",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 20))
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.wb_sunny,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            " 9-10 Am (6 Slots)",
                            style: TextStyle(
                                fontFamily: "Lobster-Regular", fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Container(
                            decoration: buildBoxDecoration(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: buildBoxDecoration(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: buildBoxDecoration(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: buildBoxDecoration(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: buildBoxDecoration(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: buildBoxDecoration(),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(0.0, 0.0),
              blurRadius: 15.0),
          BoxShadow(
              color: Colors.grey, offset: Offset(0.0, 0.0), blurRadius: 10.0),
        ]);
  }
}
