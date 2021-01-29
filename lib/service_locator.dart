import 'package:flutter_base_structure/services/toast_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => ToastService());
}

resetLocator() {
  locator.resetLazySingleton<ToastService>();
}
