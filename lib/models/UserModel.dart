import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String role;
  final String phone;

  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.role,
      required this.phone});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    String uid = data['uid'];
    String name = data['name'];
    String email = data['email'];
    String role = data['role'];
    String phone = data['phone'];
    return UserModel(
        uid: uid, name: name, email: email, role: role, phone: phone);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        phone: json['phone']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'role': role,
      'phone': phone,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'role': role,
      'phone': phone,
    };
  }
}
