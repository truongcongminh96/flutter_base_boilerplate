import 'package:catcher/model/report.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsHandler extends ConsoleHandler {
  final bool enableDeviceParameters;
  final bool enableApplicationParameters;
  final bool enableStackTrace;
  final bool enableCustomParameters;

  CrashlyticsHandler(
      {this.enableDeviceParameters = true,
      this.enableApplicationParameters = true,
      this.enableStackTrace = true,
      this.enableCustomParameters = false});

  @override
  Future<bool> handle(Report error) {
    FirebaseCrashlytics.instance.recordError(error.error, error.stackTrace);
    return Future.value(true);
  }
}
