import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/UserModel.dart';

class UserStorage {
  static const String _userKey = 'user';

  static Future<void> saveUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson()); // Convert the user object to JSON
    await prefs.setString(_userKey, userJson);
  }

  static Future<UserModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_userKey);
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson); // Convert the JSON to a Map
      return UserModel.fromJson(userMap); // Convert the Map to a user object
    }
    return null;
  }
}
