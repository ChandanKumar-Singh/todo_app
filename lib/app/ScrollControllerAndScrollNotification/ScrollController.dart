import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollControle extends GetxController {
  var scrollMessage = 'Scroll Position'.obs;
  var scrollNotificationMessage = ''.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollMessage.value = 'Reached at bottom';
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollMessage.value = 'Reached at Top';
      }
      // if (scrollController.offset !=
      //         scrollController.position.minScrollExtent &&
      //     scrollController.keepScrollOffset) {
      //   scrollMessage.value = 'Reached at Top';
      // }
    });
  }

  void scrollUp() {
    scrollController.animateTo(scrollController.offset - 50,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  void scrollDown() {
    scrollController.jumpTo(scrollController.offset + 50);
  }

  void start() {
    scrollNotificationMessage.value = 'Started';
  }

  void updated() {
    scrollNotificationMessage.value = 'Scrolling';
  }

  void end() {
    scrollNotificationMessage.value = 'Ended';
  }
}
