
import 'package:get/get.dart';
import 'package:todo_app/app/CarouselSlider/CarouselController.dart';

class CarouselBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CarouselControl());
  }
}