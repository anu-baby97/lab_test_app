import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  static const String id = "BookingDemo";
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Widget addBookingDate(String title1, String title2, String title3) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        children: [
          Text(
            title1,
            style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 25),
          ),
          Text(title2,
              style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 20)),
          Text(title3,
              style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 20))
        ],
      ),
    );
  }

  Widget addTimeSlot(String slot) {
    return Container(
      decoration: buildBoxDecoration(),
      width: 107,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Text(
            slot,
            style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget addRowOfTimeSlots(int slotnos, Icon sloticon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              sloticon,
              SizedBox(
                width: 20,
              ),
              Text(
                " $slotnos Slots",
                style: TextStyle(fontFamily: "Lobster-Regular", fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

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
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: Container(
                            decoration: buildBoxDecoration(),
                            child: addBookingDate("13", "April", "2021"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Container(
                              decoration: buildBoxDecoration(),
                              child: addBookingDate("14", "April", "2021")),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Container(
                              decoration: buildBoxDecoration(),
                              child: addBookingDate("15", "April", "2021")),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Container(
                              decoration: buildBoxDecoration(),
                              child: addBookingDate("16", "April", "2021")),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Container(
                              decoration: buildBoxDecoration(),
                              child: addBookingDate("17", "April", "2021")),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Container(
                              decoration: buildBoxDecoration(),
                              child: addBookingDate("18", "April", "2021")),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      addRowOfTimeSlots(
                          7,
                          Icon(
                            Icons.wb_sunny,
                            color: Colors.yellow,
                            size: 35,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Wrap(
                          runSpacing: 15.0,
                          children: [
                            addTimeSlot("9.00 Am"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("9.30 Am"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("10.00 Am"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("10.30 Am"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("11.00 Am"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("11.30 Am"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("12.00 Pm"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      addRowOfTimeSlots(
                          6,
                          Icon(Icons.wb_sunny_sharp,
                              color: Colors.yellow, size: 35)),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Wrap(
                          runSpacing: 15.0,
                          children: [
                            addTimeSlot("1.30 Am"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("2.00 Pm"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("2.30 Pm"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("3.00 Pm"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("3.30 Pm"),
                            SizedBox(
                              width: 10,
                            ),
                            addTimeSlot("4.00 Pm"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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
