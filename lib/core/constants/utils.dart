


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


enum ToastStates { SUCCESS, ERROR, WARNING }

void showToast({
  String? text,
  ToastStates? state,
}) =>
    Fluttertoast.showToast(
      msg: text!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: chooseToastColor(state??ToastStates.SUCCESS),
      textColor: Colors.white,
      fontSize: 16.0,
    );

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.black87;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}