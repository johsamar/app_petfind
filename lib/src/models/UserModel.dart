import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

class UserModel {
  String? id;
  String username;
  String? name;
  String? email;
  String? cellphone;
  List<double>? location;
  String? password;
  String? token;
  String? profilePicture;

  UserModel(
      {this.id,
      required this.username,
      this.name,
      this.email,
      this.cellphone,
      this.location,
      this.password,
      this.token,
      this.profilePicture});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        username: json['username'],
        name: json['name'],
        email: json['email'],
        cellphone: json['cellphone'],
        location: List<double>.from(json['location'].map((x) => x.toDouble())),
        password: json['password'],
        token: json['token'],
        profilePicture: json['profilePicture'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'name': name,
        'email': email,
        'cellphone': cellphone,
        'location': location,
        'password': password,
        'token': token,
        'profilePicture': profilePicture,
      };
}
