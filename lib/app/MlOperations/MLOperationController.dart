import 'dart:io';

import 'package:get/get.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class MLOperationController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  var extractedText = ''.obs;
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
    }
  }

  // void extractText() async {
  //   final inputImage = InputImage.fromFilePath(selectedImagePath.value);
  //   final imageLabeler = GoogleMlKit.vision.imageLabeler();
  //   final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
  //   for (ImageLabel label in labels) {
  //     final String text = label.label;
  //     final int index = label.index;
  //     final double confidence = label.confidence;
  //     extractedText.value == text;
  //   }
  //   imageLabeler.close();
  // }
}
