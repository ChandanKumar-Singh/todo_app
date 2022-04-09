import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/ScrollControllerAndScrollNotification/ScrollController.dart';

class ScrollControllerPage extends StatelessWidget {
  ScrollControllerPage({Key? key}) : super(key: key);
  ScrollControle controller = Get.put(ScrollControle());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scroll Controller And ScrollNotification',
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          InkWell(
            onTap: controller.scrollUp,
            child: Icon(Icons.arrow_circle_up_rounded),
          ),
          SizedBox(width: w * 0.02),
          InkWell(
            onTap: controller.scrollDown,
            child: Icon(Icons.arrow_circle_down_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            // height: h * 0.05,
            width: double.maxFinite,
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return Text(controller.scrollMessage.value);
              }),
            ),
          ),
          SizedBox(height: h * 0.03),
          Container(
            width: double.maxFinite,
            // height: h * 0.05,
            color: Colors.deepOrange,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return Text(controller.scrollNotificationMessage.value);
              }),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  controller.start();
                } else if (scrollNotification is ScrollUpdateNotification) {
                  controller.updated();
                }
                if (scrollNotification is ScrollEndNotification) {
                  controller.end();
                }
                return true;
              },
              child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: 21,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text('Item index is $i'),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
