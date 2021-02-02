import 'dart:convert';

import 'package:flutter_base_structure/data/network/constants/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_base_structure/models/user.dart';

class UserService {
  List<User> users;

  Future getData() async {
    String url = Endpoints.baseUrl + '/users?page=1';
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
