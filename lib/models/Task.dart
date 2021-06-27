// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

List<Task> taskFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  Task({
    required this.completed,
    required this.id,
    required this.task,
    required this.description,
    required this.periority,
    required this.deadline,
    required this.teamMember,
    required this.startedDate,
  });

  bool completed;
  String id;
  String task;
  String description;
  String periority;
  DateTime deadline;
  String teamMember;
  DateTime startedDate;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        completed: json["completed"],
        id: json["_id"],
        task: json["task"],
        description: json["description"],
        periority: json["periority"],
        deadline: DateTime.parse(json["deadline"]),
        teamMember: json["teamMember"],
        startedDate: DateTime.parse(json["startedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "completed": completed,
        "_id": id,
        "task": task,
        "description": description,
        "periority": periority,
        "deadline": deadline.toIso8601String(),
        "teamMember": teamMember,
        "startedDate": startedDate.toIso8601String(),
      };
}
