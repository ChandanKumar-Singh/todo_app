import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteWidget extends StatelessWidget {
  NoteWidget({
    Key? key,
    required this.onTap,
    this.enabled1 = true,
    this.enabled2 = true,
    this.enabled3 = true,
    this.enabled4 = true,
    required this.name,
  }) : super(key: key);

  final VoidCallback onTap;
  String name;
  final bool enabled1;
  final bool enabled2;
  final bool enabled3;
  final bool enabled4;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
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
                enabled: enabled1,
                autofocus: true,
                initialValue: name,
                onChanged: (val) {
                  name = val;
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
                enabled: enabled1,
                autofocus: true,
                initialValue: name,
                onChanged: (val) {
                  name = val;
                },
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
                enabled: enabled1,
                autofocus: true,
                initialValue: name,
                onChanged: (val) {
                  name = val;
                },
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
              TextField(
                enabled: enabled4,
                autofocus: true,
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
}
