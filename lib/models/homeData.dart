// To parse this JSON data, do
//
//     final homedata = homedataFromJson(jsonString);

import 'dart:convert';

List<Homedata> homedataFromJson(String str) =>
    List<Homedata>.from(json.decode(str).map((x) => Homedata.fromJson(x)));

String homedataToJson(List<Homedata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Homedata {
  Homedata({
    required this.projectName,
    required this.projectDesc,
    required this.creationDate,
    required this.projectOwner,
    required this.team,
  });

  String projectName;
  String projectDesc;
  DateTime creationDate;
  ProjectOwner projectOwner;
  List<ProjectOwner> team;

  factory Homedata.fromJson(Map<String, dynamic> json) => Homedata(
        projectName: json["projectName"],
        projectDesc: json["projectDesc"],
        creationDate: DateTime.parse(json["creationDate"]),
        projectOwner: ProjectOwner.fromJson(json["projectOwner"]),
        team: List<ProjectOwner>.from(
            json["team"].map((x) => ProjectOwner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "projectName": projectName,
        "projectDesc": projectDesc,
        "creationDate": creationDate.toIso8601String(),
        "projectOwner": projectOwner.toJson(),
        "team": List<dynamic>.from(team.map((x) => x.toJson())),
      };
}

class ProjectOwner {
  ProjectOwner({
    required this.name,
    required this.lastname,
    required this.avatar,
    required this.email,
  });

  String name;
  String lastname;
  String avatar;
  String email;

  factory ProjectOwner.fromJson(Map<String, dynamic> json) => ProjectOwner(
        name: json["name"],
        lastname: json["lastname"],
        avatar: json["avatar"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "avatar": avatar,
        "email": email,
      };
}
