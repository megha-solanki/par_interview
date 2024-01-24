import 'package:flutter/cupertino.dart';

class AuthModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;

  AuthModel(
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.image,
      this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: json['gender'],
        image: json['image'],
        token: json['token']);
  }
}

class AuthError {
  String? message;
  AuthError({this.message});
  factory AuthError.fromJson(Map<String, dynamic> json) {
    return AuthError(message: json['message']);
  }
}
