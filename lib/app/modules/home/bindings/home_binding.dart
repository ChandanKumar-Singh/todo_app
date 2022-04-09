import 'package:get/get.dart';
import 'package:todo_app/app/firebaseBackend/functins.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<FirebaseMethodsController>(
   FirebaseMethodsController(),
    );
  }
}
