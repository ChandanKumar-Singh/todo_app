import 'package:get/get.dart';
import 'package:todo_app/app/DraggableSheet/DraggableController/DraggableController.dart';

class DraggableBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DraggableController());
  }
}