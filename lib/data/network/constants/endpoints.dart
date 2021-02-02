import 'package:flutter_base_structure/env.dart';

class Endpoints {
  Endpoints._();

  static String baseUrl = environment['baseUrl'];

  static const int receiveTimeout = 5000;

  static const int connectionTimeout = 3000;

}