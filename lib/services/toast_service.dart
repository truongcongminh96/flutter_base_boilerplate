import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  String _defMessage = '';
  var _defToastLength = Toast.LENGTH_SHORT;
  var _defGravity = ToastGravity.CENTER;
  var _defTimeInSecForIos = 1;
  var _defBackgroundColor;
  var _defTextColor = Colors.white;
  var _defFontSize = 16.0;

  Future<bool> showToast({
    @required String msg,
    Toast toastLength,
    int timeInSecForIos,
    double fontSize,
    ToastGravity gravity,
    Color backgroundColor,
    Color textColor,
    // Function(bool) didTap,
  }) async {
    if (msg == null) {
      msg = _defMessage;
    }
    if (toastLength == null) {
      toastLength = _defToastLength;
    }
    if (timeInSecForIos == null) {
      timeInSecForIos = _defTimeInSecForIos;
    }
    if (fontSize == null) {
      fontSize = _defFontSize;
    }
    if (gravity == null) {
      gravity = _defGravity;
    }
    if (backgroundColor == null) {
      backgroundColor = _defBackgroundColor;
    }
    if (textColor == null) {
      textColor = _defTextColor;
    }

    return Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        timeInSecForIosWeb: timeInSecForIos,
        fontSize: fontSize,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor);
  }
}
