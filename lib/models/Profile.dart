// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.active,
    required this.notifications,
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.password,
    required this.avatar,
    required this.date,
    required this.v,
  });

  bool active;
  List<dynamic> notifications;
  String id;
  String name;
  String lastname;
  String email;
  String phoneNumber;
  int role;
  String password;
  String avatar;
  DateTime date;
  int v;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        active: json["active"],
        notifications: List<dynamic>.from(json["notifications"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        password: json["password"],
        avatar: json["avatar"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "notifications": List<dynamic>.from(notifications.map((x) => x)),
        "_id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone_number": phoneNumber,
        "role": role,
        "password": password,
        "avatar": avatar,
        "date": date.toIso8601String(),
        "__v": v,
      };
}
