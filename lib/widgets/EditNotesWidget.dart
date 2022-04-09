import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNoteWidget extends StatelessWidget {
  const EditNoteWidget({
    Key? key,
    required this.h,
    required this.w,
    required this.onTap,
  }) : super(key: key);

  final double h;
  final double w;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () =>Get.back(),
                  child: Text('CANCEL'),
                ),
              )),
        ],
      ),
    );
  }
}
