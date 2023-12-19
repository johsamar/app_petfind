import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

class PetModel {
  String? id;
  String name;
  String details;
  String breed;
  String specie;
  String color;
  String size;
  String age;
  List<String>? images;
  String owner;

  PetModel(
      {this.id,
      required this.name,
      required this.details,
      required this.breed,
      required this.specie,
      required this.color,
      required this.size,
      required this.age,
      this.images,
      required this.owner});

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        id: json['id'],
        name: json['name'],
        details: json['details'],
        breed: json['breed'],
        specie: json['specie'],
        color: json['color'],
        size: json['size'],
        age: json['age'],
        images: json['images'] != null
            ? List<String>.from(json['images'].map((x) => x))
            : null,
        owner: json['owner'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'details': details,
        'breed': breed,
        'specie': specie,
        'color': color,
        'size': size,
        'age': age,
        'images': images != null ? List<dynamic>.from(images!.map((x) => x)) : null,
        'owner': owner,
      };
}
