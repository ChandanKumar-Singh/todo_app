import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/InternetConnectionStatus/Controllers/NetworkController.dart';
import 'package:todo_app/app/ImagePicker/imageController.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<ImageController>(() => ImageController());
  }
}
