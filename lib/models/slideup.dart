// To parse this JSON data, do
//
//     final slideUp = slideUpFromJson(jsonString);

import 'dart:convert';

SlideUp slideUpFromJson(String str) => SlideUp.fromJson(json.decode(str));

String slideUpToJson(SlideUp data) => json.encode(data.toJson());

class SlideUp {
  SlideUp({
    required this.active,
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.avatar,
    required this.date,
  });

  bool active;
  String id;
  String name;
  String lastname;
  String email;
  String phoneNumber;
  String password;
  String avatar;
  DateTime date;

  factory SlideUp.fromJson(Map<String, dynamic> json) => SlideUp(
        active: json["active"],
        id: json["_id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        avatar: json["avatar"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "_id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "avatar": avatar,
        "date": date.toIso8601String(),
      };
}
