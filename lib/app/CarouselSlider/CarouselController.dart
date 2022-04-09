import 'package:get/get.dart';
import 'package:todo_app/app/CarouselSlider/providers/popular_provider.dart';

class CarouselControl extends GetxController {
  var lstPopular = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isDataError = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPopular();
  }

  void getPopular() async {
    try {
      isDataProcessing.value = true;
      await PopularProvider().getPopular().then((response) {
        // print(response.length);
        lstPopular.clear();
        isDataProcessing.value = false;
        lstPopular.addAll(response);
        // print(lstPopular.length);
        // print(isDataProcessing.value);
      }, onError: (err) {
        print('Error ----------------$err');
        isDataProcessing(false);
        isDataError(true);
      });
    } catch (e) {
      print('Catch ----------------$e');
      isDataProcessing(false);
      isDataError(true);
    }
  }
}
