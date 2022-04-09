import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:todo_app/app/CarouselSlider/CarouselController.dart';

import 'FailureView.dart';

class CarouselView extends GetView<CarouselControl> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Carousel Slider')),
      body: Obx(() {
        if (controller.isDataProcessing.value) {
          // print(
          //     '---------------' + controller.isDataProcessing.value.toString());
          return Center(
            child: Container(
              child: CircularProgressIndicator(),
              margin: EdgeInsets.all(8),
            ),
          );
        } else {
          if (controller.isDataError.value) {
            return FailureView(
              onPressed: () => controller.getPopular(),
              message: 'Error Occurred',
              title: 'Please try again',
            );
          } else {
            return CarouselSlider(
                items: generateSlider(),
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height));

            // return Center(
            //   child: Container(
            //     child: CircularProgressIndicator(),
            //     margin: EdgeInsets.all(8),
            //   ),
            // );
          }
        }
      }),
    );
  }

  List<Widget> generateSlider() {
    // print('888888888888888888 ' + controller.lstPopular.length.toString());
    List<Widget> imageSliders = controller.lstPopular.map((element) {
      // print(element['image_thumbnail_path']);
      return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                image: NetworkImage(
                    element['image_thumbnail_path']),
                fit: BoxFit.cover,),),
        // child: ClipRRect(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        //   child: CachedNetworkImage(
        //     imageUrl: 'https://static.episodate.com/images/tv-show/thumbnail/35624.jpg',
        //     fit: BoxFit.cover,
        //     width: Get.width,
        //     placeholder: (context, url) => Container(
        //       color: Colors.grey,
        //     ),
        //     errorWidget: (context, url, error) => Icon(
        //       Icons.error,
        //       color: Colors.red,
        //     ),
        //   ),
        // ),
      );
    }).toList();
    return imageSliders;
  }
}
