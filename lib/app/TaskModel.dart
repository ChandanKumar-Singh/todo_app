import 'package:flutter/foundation.dart';

class Task {
  Task({
     this.id,
    required this.info,
    required this.createdTime,
    required this.lastUpdate,
    required this.lists,
  });
  late final String? id;
  late final Info info;
  late final DateTime createdTime;
  late final DateTime lastUpdate;
  late final List<Lists> lists;

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    info = Info.fromJson(json['info']);
    createdTime = json['createdTime'];
    lastUpdate = json['lastUpdate'];
    lists = List.from(json['lists']).map((e) => Lists.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    // _data['belongsToUser'] = Info.;
    _data['createdTime'] = createdTime.toIso8601String();
    _data['lastUpdate'] = lastUpdate.toIso8601String();
    _data['lists'] = lists.map((e) => e.toJson()).toList();
    return _data;
  }
}
class Lists {
  Lists({
     this.groupName,
    required this.tasks,
  });
  late final String? groupName;
  late final List<Tasks> tasks;

  Lists.fromJson(Map<String, dynamic> json) {
    groupName = json['name'];
    tasks = List.from(json['tasks']).map((e) => Tasks.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = groupName;
    _data['tasks'] = tasks.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Tasks {
  Tasks({
    required this.title,
    required this.description,
    required this.addedOn,
    required this.lastUpdate,
    required this.done,
  });
  late final String? title;
  late final String? description;
  late final DateTime? addedOn;
  late final DateTime? lastUpdate;
  late final bool? done;

  Tasks.fromJson(Map<String, dynamic> json) {
    title = json['name'];
    description = json['description'];
    addedOn = DateTime.parse(json["addedOn"]);
    lastUpdate = DateTime.parse(json["lastUpdate"]);
    done = json['done'];
  }


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = title;
    _data['description'] = description;
    _data['addedOn'] = addedOn!.toIso8601String();
    _data['lastUpdate'] = lastUpdate!.toIso8601String();
    _data['done'] = done;
    return _data;
  }
}

class Info {
  Info({
    required this.id,
    required this.name,
     this.email,
    this.age,
    this.imageUrl,
  });
  late final String id;
  late final String name;
  late final String? email;
  late final int? age;
  late final String? imageUrl;

  Info.fromJson(Map<String, dynamic> data) {

    id = data['id'];
    name = data['name'];
    email = data['email'];
    age = data['age'];
    imageUrl = data['imageUrl'];
  }
  Map<String, dynamic>  tojson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
