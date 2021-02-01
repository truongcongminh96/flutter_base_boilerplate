import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_base_structure/models/user.dart';

class UserService {
  List<User> users;

  Future getData(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      users = (data['data'] as List).map((json) {
        return User.fromJSON(json);
      }).toList();
      return users;
    } else {
      print("Error in URL");
    }
  }
}
