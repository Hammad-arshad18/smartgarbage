import 'package:flutter/foundation.dart';

class UserModel {
  String? uid;
  String? Username;
  String? Email;

  UserModel({this.uid, this.Email, this.Username});

// Sending Data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': Email,
      'username': Username,
    };
  }
}
