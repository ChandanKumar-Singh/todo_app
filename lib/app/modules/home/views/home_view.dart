import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/InternetConnectionStatus/Controllers/NetworkController.dart';
import 'package:todo_app/app/Drawer/NavigationDrawer.dart';
import 'package:todo_app/app/firebaseBackend/functins.dart';
import 'package:todo_app/app/modules/NotesListPage/PersonalNotesList.dart';
import 'package:todo_app/widgets/EditNotesWidget.dart';

import '../../../../widgets/AppBarContent.dart';
import '../../../../widgets/BelongersList.dart';
import '../../../../widgets/HomeNotesWidget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<FirebaseMethodsController> {
  TextEditingController nameController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      key: networkController.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: h * 0.13,
        title: AppBarContent(),
        centerTitle: false,
      ),
      drawer: NavigationDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: h * 0.15,
              // color: Colors.yellow,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    double padding = h * 0.05;
                    return Padding(
                      padding:
                          EdgeInsets.only(left: i == 0 ? padding : h * 0.02),
                      child: Container(
                        width: w * 0.2,
                        // height: w*0.5,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.pink,
                              child: Icon(Icons.add_a_photo_rounded),
                            ),
                            Wrap(
                              children: [
                                Text(
                                  'Belongers Name',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Get.to(PersonalNotesList()),
              child: Container(
                height: h * 0.09,
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.orange, Colors.indigo]),
                  borderRadius: BorderRadius.circular(w * 0.03),
                ),
                child: Center(
                    child: Text(
                  'My Notes',
                  style: TextStyle(fontSize: 30),
                )),
              ),
            ),
          ),
          BelongersList(w: w, h: h),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(AddNoteWidget(
            onTap: () {
              controller.addBelongedNotes(
                  name: nameController.text,
                  title: titleController.text,
                  description: descriptionController.text);
              print(nameController.text);
            },
            w: w,
            h: h,
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget AddNoteWidget(
      {required double w, required double h, required VoidCallback onTap}) {
    return Container(
      height: h * 0.55,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w * 0.05),
              topRight: Radius.circular(w * 0.05))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                decoration: BoxDecoration(
                    color: Colors.green,

                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(w * 0.05)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('ADD A NOTE')),
                ),
              ),
              SizedBox(height: w * 0.02),
              TextFormField(
                autofocus: true,
                initialValue: nameController.text,
                onChanged: (val) {
                  nameController.text = val;
                },
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    fillColor: Colors.tealAccent,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        )),
                    hintStyle: TextStyle(color: Colors.green),
                    hintText: 'Your Name'),
              ),
              SizedBox(height: w * 0.02),
              TextFormField(
                autofocus: true,
                initialValue: groupController.text,
                onChanged: (val) {
                  groupController.text = val;
                },
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.green),
                    hintText: 'Group ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ))),
              ),
              SizedBox(height: w * 0.02),
              TextFormField(
                autofocus: true,
                initialValue: titleController.text,
                onChanged: (val) {
                  titleController.text = val;
                },
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.green),
                    hintText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ))),
              ),
              SizedBox(height: w * 0.02),
              TextFormField(
                autofocus: true,
                initialValue: descriptionController.text,
                onChanged: (val) {
                  descriptionController.text = val;
                },
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        )),
                    hintStyle: TextStyle(color: Colors.green),
                    hintText: 'Description'),
              ),
              SizedBox(height: w * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: onTap,
                      child: Text('ADD NOTE'),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () => Get.back(),
                      child: Text('CANCEL'),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget EditNoteWidget(
      {required double w, required double h, required VoidCallback onTap}) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: w,
                  decoration: BoxDecoration(
                      color: Colors.green,

                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(w * 0.05)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Center(child: Text('EDIT')),
                  ),
                ),
                SizedBox(height: w * 0.02),
                TextField(
                  autofocus: true,
                  style: TextStyle(color: Colors.green),
                  decoration: InputDecoration(
                      fillColor: Colors.tealAccent,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.03),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          )),
                      hintStyle: TextStyle(color: Colors.green),
                      hintText: 'Title'),
                ),
                SizedBox(height: w * 0.02),
                TextField(
                  selectionHeightStyle: BoxHeightStyle.max,
                  maxLines: 100,
                  autofocus: true,
                  style: TextStyle(color: Colors.green),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.green),
                      hintText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.03),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ))),
                ),
                SizedBox(height: w * 0.02),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: onTap,
              child: Text('SAVE'),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () => Get.back(),
              child: Text('CANCEL'),
            ),
          )),
        ],
      ),
    );
  }
}
