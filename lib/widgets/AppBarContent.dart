import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/app/FingerprintAndFaceLock/FFAuthController.dart';
import 'package:todo_app/app/ImagePicker/imageController.dart';
import 'package:todo_app/app/MlOperations/MLOperationPage.dart';
import 'package:todo_app/app/ScrollControllerAndScrollNotification/ScrollControllerPage.dart';

import '../InternetConnectionStatus/Controllers/NetworkController.dart';

class AppBarContent extends GetView<NetworkController> {
  AppBarContent({
    Key? key,
  }) : super(key: key);
  ImageController imageController = Get.put(ImageController());
  FFAuthControl ffAuthController = Get.put(FFAuthControl());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => CircleAvatar(
                    radius: 30,
                    backgroundColor: imageController.imageUrl.value == ''
                        ? Colors.blueGrey
                        : Colors.transparent,
                    backgroundImage: imageController.imageUrl.value != ''
                        ?
                        // FileImage(
                        //         File(imageController.selectedImagePath.value))
                        NetworkImage(imageController.imageUrl.value)
                        : null,
                  )),
              Row(
                children: [
                  Text('HomeView'),
                ],
              ),
            ],
          ),
        ),
        InkWell(onTap: controller.openDrawer, child: Icon(Icons.menu)),
        PopupMenuButton(itemBuilder: (context) {
          var n = controller.connectionStatus.value;
          String message = n == 0
              ? 'No Connection'
              : n == 1
                  ? 'Mobile Network'
                  : 'Wi-Fi Connection';
          return [
            PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.wifi_outlined),
                    SizedBox(width: w * 0.03),
                    Text('Check Connection Status'),
                  ],
                ),
                onTap: () => Get.snackbar('Network Info', '$message')
                // imageController.getImage(ImageSource.camera),
                ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.account_circle_rounded),
                  SizedBox(width: w * 0.03),
                  Text('Profile Pic'),
                ],
              ),
              onTap: () => imageController.getImage(ImageSource.camera),
            ),
          ];
        }),
      ],
    );
  }
}
