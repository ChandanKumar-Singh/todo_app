import 'package:get/get.dart';
import 'package:todo_app/app/VideoPlayer/Controllelr/VideoPlayerController.dart';

class VideoPageBindings extends Bindings{
  @override
  void dependencies() {

    Get.put(VideoPlayerControl());
  }
}