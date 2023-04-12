// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SnackModel {
  String title;
  DateTime date;
  TimeOfDay hours;
  bool inDiet;
  SnackModel({
    required this.title,
    required this.date,
    required this.hours,
    required this.inDiet,
  });
}
