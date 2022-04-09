import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/app/MlOperations/MLOperationController.dart';

class MLOperationPage extends GetView<MLOperationController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(title: Text('ML Operations')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.1, vertical: w * 0.05),
        child: Column(
          children: [
            Container(
              height: h * 0.3,
              child: Image.file(File(controller.selectedImagePath.value)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () => controller.getImage(ImageSource.gallery),
                    child: Text('Pick Image'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Extract Code/Text ',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: h * 0.3,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Color(0x34379734),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => Text(controller.extractedText.value.isEmpty
                    ? 'No text found'
                    : controller.extractedText.value)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
