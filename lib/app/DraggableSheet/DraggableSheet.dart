import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/DraggableSheet/DraggableController/DraggableController.dart';

// It is a widget which drags down from bottom and
// expands in vertical direction. It expands up to a
// certain fraction of the screen as
//specified and then enables scrolling within
// the expanded height.
class DraggablePage extends GetView<DraggableController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Draggable Scrollable Sheet'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: context.width,
              height: 100,
              color: Colors.purple,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                child: Text(
                  'Draggable Scrollable Sheet Demo',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: DraggableScrollableSheet(
                builder: (BuildContext buildContext,
                    ScrollController scrollController) {
                  return ListView.builder(
                    itemBuilder: (BuildContext buildContext, int index) {
                      return Obx(
                        () => (ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            child: Text(
                              index.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            'Index position is $index',
                            style: TextStyle(
                                color: controller.selected[index]
                                    ? Colors.red
                                    : Colors.black),
                          ),
                          tileColor: Colors.grey,
                          selectedTileColor:
                              controller.selected[index] ? Colors.blue : null,
                          selected: controller.selected[index],
                          onTap: () => controller.selected[index] =
                              !controller.selected[index],
                        )),
                      );
                    },
                    itemCount: 40,
                    controller: scrollController,
                  );
                },
                // minChildSize<=initialChildSize
                // initial size of the sheet when app is opened.
                // default value 0.5
                initialChildSize: .5, //will take 30% of screen space
                //minimum size to which sheet can be dropped down.
                // default value .25
                minChildSize: .3,

                //max size to which  sheet can be dragged up
                //default value 1.0
                maxChildSize: 0.9,
              ),
            ),
            Container(
              width: context.width,
              height: 300,
              color: Colors.purple,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                child: Text(
                  'Draggable Scrollable Sheet Demo',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ));
  }
}
