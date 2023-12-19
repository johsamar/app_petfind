import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

class ReportModel {
  String? id;
  String user;
  String pet_id;
  String type;
  DateTime date;
  List<double> location;

  ReportModel(
      {this.id,
      required this.user,
      required this.pet_id,
      required this.type,
      required this.date,
      required this.location});

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        id: json['id'],
        user: json['user'],
        pet_id: json['pet_id'],
        type: json['type'],
        date: DateTime.parse(json['date']),
        location: List<double>.from(json['location'].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'pet_id': pet_id,
        'type': type,
        'date': date,
        'location': location,        
      };
}
