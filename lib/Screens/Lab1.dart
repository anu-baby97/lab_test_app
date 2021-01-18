import 'package:flutter/material.dart';
import 'package:lab_test_booking_app/Screens/BookingScreen.dart';

class Lab1 extends StatefulWidget {
  @override
  _Lab1State createState() => _Lab1State();
  static const String id = 'Lab 1';
}

enum options { clinic, home }

class _Lab1State extends State<Lab1> {
  options _options = options.clinic;
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                "Where do you want to test ?",
                                style: TextStyle(
                                    color: Colors.cyan.shade800,
                                    fontFamily: "Lobster-Regular",
                                    fontSize: 27),
                              ),
                              pinned: true,
                              backgroundColor: Colors.cyan.shade200,
                            ),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RadioListTile<options>(
                                    title: const Text('At Clinic'),
                                    value: options.clinic,
                                    groupValue: _options,
                                    onChanged: (options value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    },
                                  ),
                                  RadioListTile<options>(
                                    title: const Text('At Home'),
                                    value: options.home,
                                    groupValue: _options,
                                    onChanged: (options value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FlatButton(
                            onLongPress: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, BookingScreen.id, (route) => true);
                            },
                            highlightColor: Colors.cyan,
                            focusColor: Colors.cyan.shade200,
                            color: Colors.cyan.shade100,
                            textColor: Colors.black,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.red,
                            splashColor: Colors.cyan.shade200,
                            onPressed: () {},
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                  fontFamily: "Lobster-Regular",
                                  color: Colors.cyan.shade800,
                                  fontSize: 27),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
