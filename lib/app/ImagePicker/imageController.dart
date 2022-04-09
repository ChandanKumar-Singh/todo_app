import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/auth_strings.dart';

class ImageController extends GetxController {
  FirebaseStorage storage = FirebaseStorage.instance;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var imageUrl = ''.obs;

  //crop
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  //compress
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  void getImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    // print(pickedFile);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              'Mb';
      print(
          'selected image size --------------------- ${selectedImageSize.value}');

      // await cropImage();
      //UPLOAD TO STORAGE
      Reference reference = storage.ref().child('PersonalProfilePic');
      TaskSnapshot uploadedFile =
          await reference.putFile(File(selectedImagePath.value));
      print('Photo Uploaded');
      if (uploadedFile.state == TaskState.success) {
        imageUrl.value = await reference.getDownloadURL();
      }
    } else {
      Get.snackbar('Error', 'No image selected',
          backgroundColor: Colors.red, colorText: CupertinoColors.white);
    }

    //crop

    //compress
    // compressImage();
  }

  // cropImage() async {
  //   final cropImageFile = await ImageCropper().cropImage(
  //       sourcePath: selectedImagePath.value,
  //       maxHeight: 512,
  //       maxWidth: 512,
  //       compressFormat: ImageCompressFormat.jpg);
  //   cropImagePath.value = cropImageFile!.path;
  //   cropImageSize.value =
  //       ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
  //               .toStringAsFixed(2) +
  //           ' Mb';
  //
  //   // final sampledFile = await ImageCrop.sampleImage(
  //   //   file: File(selectedImagePath.value),
  //   //   preferredWidth: 512,
  //   //   preferredHeight: 512,
  //   // );
  //   //
  //   // final croppedFile = await ImageCrop.cropImage(
  //   //   file: sampledFile,
  //   //   area: Rect.fromCircle(center: Offset(0, 0), radius: 40),
  //   // );
  //   // cropImagePath.value = croppedFile.path;
  //   // cropImageSize.value =
  //   //     ((croppedFile.lengthSync()) / 1024 / 1024).toStringAsFixed(2) + ' Mb';
  //   // print('crop path ---${cropImagePath.value}');
  //   // print('crop size ---${cropImageSize.value}');
  //   // // print('compress path ---${compressImagePath.value}');
  //   // // print('compress size ---${compressImageSize.value}');
  // }

  // void compressImage() async {
  //   final dir = await Directory.systemTemp;
  //   final targetpath = dir.absolute.path + '/temp.jpg';
  //   var compressFile = await FlutterImageCompress.compressAndGetFile(
  //       cropImagePath.value, targetpath,
  //       quality: 90);
  //   compressImagePath.value = compressFile!.path;
  //   compressImageSize.value =
  //       ((File(compressImageSize.value)).lengthSync() / 1024 / 1024)
  //               .toStringAsFixed(2) +
  //           ' Mb';
  //   print('compress path ---${compressImagePath.value}');
  //   print('compress size ---${compressImageSize.value}');
  // }

  void fetchImageUrl() async {
    Reference reference = storage.ref().child('PersonalProfilePic');
    imageUrl.value = await reference.getDownloadURL();
    print(imageUrl);
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchImageUrl();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
