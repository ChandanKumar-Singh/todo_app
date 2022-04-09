import 'package:get/get.dart';
import 'package:todo_app/app/CarouselSlider/CarouselBinding/CarouselBinding.dart';
import 'package:todo_app/app/CarouselSlider/views/CarouselView.dart';
import 'package:todo_app/app/DraggableSheet/DraggableBinding.dart';
import 'package:todo_app/app/DraggableSheet/DraggableSheet.dart';
import 'package:todo_app/app/ScrollControllerAndScrollNotification/ScrollControllerPage.dart';
import 'package:todo_app/app/VideoPlayer/Bnding/VideoPageBindings.dart';
import 'package:todo_app/app/VideoPlayer/Views/VideoPage.dart';

import 'package:todo_app/app/modules/home/bindings/home_binding.dart';
import 'package:todo_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.SCROLLPAGE,
      page: () => ScrollControllerPage(),
    ),
    GetPage(
      name: _Paths.CAROUSEL,
      page: () => CarouselView(),
      binding: CarouselBinding(),
    ),
    GetPage(
      name: _Paths.VIDEOPLAYER,
      page: () => VideoPage(),
      binding: VideoPageBindings(),
    ),  GetPage(
      name: _Paths.DRAGPAGE,
      page: () => DraggablePage(),
      binding: DraggableBinding(),
    ),

  ];
}
