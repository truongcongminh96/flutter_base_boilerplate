import 'package:flutter_base_structure/services/toast_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  var preferences = await SharedPreferences.getInstance();

  locator.registerLazySingleton(() => ToastService());
}

resetLocator() {
  locator.resetLazySingleton<ToastService>();
}
