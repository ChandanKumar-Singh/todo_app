import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControl extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    final videoPlayerController = await VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    print('initialized'+videoPlayerController.value.toString());
    await videoPlayerController
        .initialize()
        .then((value) => print('initialized' + initialized.toString()));

    final chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    final playerWidget = Chewie(
      controller: chewieController,
    );
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    videoPlayerController.dispose();
    chewieController!.dispose();
  }
}
