import 'dart:convert';

class SnackModel {
  String id;
  String title;
  String description;
  DateTime date;
  String hour;
  bool inDiet;
  SnackModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.hour,
    required this.inDiet,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'hour': hour,
      'inDiet': inDiet,
    };
  }

  factory SnackModel.fromMap(Map<String, dynamic> map) {
    return SnackModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      hour: map['hour'] as String,
      inDiet: map['inDiet'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SnackModel.fromJson(String source) =>
      SnackModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
