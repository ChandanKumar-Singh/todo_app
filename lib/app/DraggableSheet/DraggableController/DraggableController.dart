import 'package:get/get.dart';

class DraggableController extends GetxController {
  // var isSelected = false.obs;
  List<bool> selected = List.generate(40, (index) => false).obs;
}
