import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/TaskModel.dart';
import 'package:todo_app/app/firebaseBackend/fbConstants.dart';

class FirebaseMethodsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime addedOn = DateTime.now();
  DateTime lastUpdate = DateTime.now();
  List<Tasks> belongersTasksList = [];
  // List<Lists> belongersGroupList = [];

  void addBelongedNotes(
      {required String name,
      required String title,
      required String description}) async {
    Tasks tasks = Tasks(
        title: title,
        description: description,
        addedOn: addedOn,
        lastUpdate: lastUpdate,
        done: true);
    List<Tasks> tasksList = [];
    tasksList.add(tasks);

    ///
    Lists lists = Lists(tasks: tasksList);
    List<Lists> groupList = [];
    groupList.add(lists);

    ///
    Task task = Task(
      id: addedOn.toString(),
      info: Info(id: addedOn.toString(), name: name, email: null),
      createdTime: addedOn,
      lastUpdate: lastUpdate,
      lists: groupList,
    );

    ///

    DocumentReference reference = firestore
        .collection(USER_COLLECTION)
        .doc('uid')
        .collection(BELONGSTO)
        .doc('theirId');
    await reference
        .set(task.toJson())
        .then((value) => print('Belonger Note Added'));
    // Tasks tasks = Tasks(name: name, description: note, done: null);
    // await reference.set(Task(id: 2, info: , createdTime: createdTime, lastUpdate: lastUpdate, lists: lists));
  }

  void addTasks({required String title, required String description}) async {
    DocumentSnapshot<Map<String, dynamic>> snap = await firestore
        .collection(USER_COLLECTION)
        .doc('uid')
        .collection(BELONGSTO)
        .doc('theirId')
        .get();
    print(snap.data()!['lists']);
    if (snap.data() != null) {
      List<Tasks> lists = [];
      lists.addAll(List.from(snap.data()!['lists'])
          .map((e) => Tasks.fromJson(e))
          .toList());
      lists.add(Tasks(
          title: title,
          description: description,
          addedOn: addedOn,
          lastUpdate: lastUpdate,
          done: true));
      await firestore
          .collection(USER_COLLECTION)
          .doc('uid')
          .collection(BELONGSTO)
          .doc('theirId')
          .update({'lists': lists.map((e) => e.toJson()).toList()});
    } else {
      List<Tasks> lists = [];

      lists.add(Tasks(
          title: title,
          description: description,
          addedOn: addedOn,
          lastUpdate: lastUpdate,
          done: true));
      await firestore
          .collection(USER_COLLECTION)
          .doc('uid')
          .collection(BELONGSTO)
          .doc('theirId')
          .update({'lists': lists.map((e) => e.toJson()).toList()});
    }
  }

  void belongListLength() async {
    DocumentSnapshot<Map<String, dynamic>> snap = await firestore
        .collection(USER_COLLECTION)
        .doc('uid')
        .collection(BELONGSTO)
        .doc('theirId')
        .get();
    if (snap.data() != null) {
      // List<Tasks> lists = [];
      belongersTasksList.addAll(List.from(snap.data()!['lists'])
          .map((e) => Tasks.fromJson(e))
          .toList());
      update();
    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    belongersTasksList.length;
    super.onInit();
  }
}
