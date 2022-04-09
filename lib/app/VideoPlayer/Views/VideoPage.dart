import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/VideoPlayer/Controllelr/VideoPlayerController.dart';

class VideoPage extends GetView<VideoPlayerControl> {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VideoPage')),
      body: Column(
        children: [
          GetBuilder<VideoPlayerControl>(
            init: VideoPlayerControl(),
            builder: (controller) {
              print(controller.chewieController?.videoPlayerController);
              print(controller.chewieController);
              return Expanded(
                child: Center(
                  child: controller.chewieController != null &&
                          controller.chewieController!.videoPlayerController
                              .value.isInitialized
                      ? Chewie(controller: controller.chewieController!)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 10),
                            Text('Loading'),
                          ],
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
