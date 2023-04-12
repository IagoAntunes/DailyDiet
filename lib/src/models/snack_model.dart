// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SnackModel {
  String title;
  String description;
  DateTime date;
  String hour;
  bool inDiet;
  SnackModel({
    required this.title,
    required this.description,
    required this.date,
    required this.hour,
    required this.inDiet,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': Timestamp.fromDate(date),
      'hour': hour,
      'inDiet': inDiet,
    };
  }

  factory SnackModel.fromMap(Map<String, dynamic> map) {
    return SnackModel(
      title: map['title'] as String,
      description: map['description'] as String,
      date: (map['date'] as Timestamp).toDate(),
      hour: map['hour'] as String,
      inDiet: map['inDiet'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SnackModel.fromJson(String source) =>
      SnackModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
