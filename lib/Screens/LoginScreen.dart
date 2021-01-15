import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset("assets/clinic.png"),
            ],
          ),
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/logo.png",
                      width: ScreenUtil.getInstance().setWidth(70),
                      height: ScreenUtil.getInstance().setHeight(110),
                    ),
                    Text("MEDICOS",
                        style: TextStyle(
                            color: Colors.cyan,
                            fontFamily: "Poppins-Bold",
                            fontSize: ScreenUtil.getInstance().setSp(40),
                            letterSpacing: .6,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
