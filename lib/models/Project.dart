// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

List<Project> projectFromJson(String str) =>
    List<Project>.from(json.decode(str).map((x) => Project.fromJson(x)));

String projectToJson(List<Project> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Project {
  Project({
    required this.started,
    required this.id,
    required this.projectName,
    required this.projectDesc,
    required this.projectOwner,
  });

  bool started;
  String id;
  String projectName;
  String projectDesc;
  ProjectOwner projectOwner;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        started: json["started"],
        id: json["_id"],
        projectName: json["projectName"],
        projectDesc: json["projectDesc"],
        projectOwner: ProjectOwner.fromJson(json["projectOwner"]),
      );

  Map<String, dynamic> toJson() => {
        "started": started,
        "_id": id,
        "projectName": projectName,
        "projectDesc": projectDesc,
        "projectOwner": projectOwner.toJson(),
      };
}

class ProjectOwner {
  ProjectOwner({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.avatar,
  });

  String id;
  String name;
  String lastname;
  String email;
  String avatar;

  factory ProjectOwner.fromJson(Map<String, dynamic> json) => ProjectOwner(
        id: json["_id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "avatar": avatar,
      };
}
