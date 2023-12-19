import 'dart:core';
import 'package:app_petfind/src/models/PetModel.dart';
import 'package:app_petfind/src/models/UserModel.dart';
import 'package:json_annotation/json_annotation.dart';

class ReportModelUserPet {
  String? id;
  UserModel user;
  PetModel pet;
  String type;
  DateTime date;
  List<double> location;

  ReportModelUserPet(
      {this.id,
      required this.user,
      required this.pet,
      required this.type,
      required this.date,
      required this.location});

  factory ReportModelUserPet.fromJson(Map<String, dynamic> json) => ReportModelUserPet(
        id: json['id'],
        user: UserModel.fromJson(json['user']),
        pet: PetModel.fromJson(json['pet']),
        type: json['type'],
        date: DateTime.parse(json['date']),
        location: List<double>.from(json['location'].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'date': date,
        'location': location,        
      };
}
