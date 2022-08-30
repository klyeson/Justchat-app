import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserData {
  String id;
  final String name;
  final int age;
  final String about;
  final String hobbies;
  final String interests;

  UserData({
    this.id = '',
    required this.name,
    required this.age,
    required this.about,
    required this.hobbies,
    required this.interests,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'Name': name,
        'Age': age,
        'About': about,
        'Hobbies': hobbies,
        'Interests': interests,
      };

  static UserData fromJson(Map<String, dynamic> json) => UserData(
      name: json['Name'],
      age: json['Age'],
      about: json['About'],
      hobbies: json['Hobbies'],
      interests: json['Interests']);
}
