import 'dart:io';

import 'package:catcher/model/report.dart';
import 'package:flutter/material.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:flutter_base_structure/service_locator.dart';
import 'package:flutter_base_structure/services/toast_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ErrorHandler extends ConsoleHandler {
  final bool enableDeviceParameters;
  final bool enableApplicationParameters;
  final bool enableStackTrace;
  final bool enableCustomParameters;

  ErrorHandler(
      {this.enableDeviceParameters = true,
      this.enableApplicationParameters = true,
      this.enableStackTrace = true,
      this.enableCustomParameters = false});

  Future<bool> handle(Report error) {
    if (error.error is SocketException) {
      locator<ToastService>().showToast(
          msg: 'Check your internet',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFFED1C24),
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return Future.value(true);
  }
}
