import 'dart:async';

import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/app.dart';
import 'package:flutter_base_structure/crashlyticshandler.dart';
import 'package:flutter_base_structure/errorhandler.dart';
import 'package:flutter_base_structure/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  CatcherOptions debugOptions = CatcherOptions(SilentReportMode(), [
    ConsoleHandler(),
    ErrorHandler(),
  ]);
  CatcherOptions releaseOptions = CatcherOptions(
      SilentReportMode(), [ErrorHandler(), CrashlyticsHandler()]);

  await runZoned<Future<Null>>(() async {
    Catcher(
        rootWidget: MyApp(),
        debugConfig: debugOptions,
        releaseConfig: releaseOptions);
  });
}
