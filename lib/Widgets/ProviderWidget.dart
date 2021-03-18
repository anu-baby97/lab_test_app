import 'package:lab_test_booking_app/services/authServices.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final AuthService auth;

  Provider({Key key, Widget child, this.auth}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) =>
      (context.getElementForInheritedWidgetOfExactType() as Provider);
}