import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/FingerprintAndFaceLock/FFAuthController.dart';
import 'package:todo_app/app/ImagePicker/imageController.dart';
import '../routes/app_pages.dart';

class NavigationDrawer extends StatelessWidget {
  ImageController controller = Get.put(ImageController());
  FFAuthControl ffAuthController = Get.put(FFAuthControl());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Drawer(
      backgroundColor: Colors.grey,
      child: Container(
        width: w * 0.5,
        child: ListView(
          children: [
            buildDrawerHeader(),
            Divider(
              color: Colors.green,
              height: 3,
              thickness: 2,
            ),
            buildDrawerItem(
              icon: Icons.swap_calls_rounded,
              text: "ScrollController",
              onTap: () => navigate(0),
              tileColor:
                  Get.currentRoute == Routes.SCROLLPAGE ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.SCROLLPAGE
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.bookmarks_rounded,
              text: "Carousel Page",
              onTap: () => navigate(1),
              tileColor:
                  Get.currentRoute == Routes.CAROUSEL ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.CAROUSEL
                  ? Colors.white
                  : Colors.black,
            ),buildDrawerItem(
              icon: Icons.ondemand_video,
              text: "Video Player",
              onTap: () => navigate(2),
              tileColor:
                  Get.currentRoute == Routes.VIDEOPLAYER ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.VIDEOPLAYER
                  ? Colors.white
                  : Colors.black,
            ),buildDrawerItem(
              icon: Icons.ondemand_video,
              text: "Draggable Sheet",
              onTap: () => navigate(3),
              tileColor:
                  Get.currentRoute == Routes.DRAGPAGE ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.DRAGPAGE
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
                icon: Icons.fingerprint_rounded,
                text: "Authenticate",
                onTap: () => Get.dialog(
                      AlertDialog(
                        title: Text('Available Auth Methods'),
                        content: Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ffAuthController.hasFaceLock.value == true
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          )
                                        : Icon(
                                            Icons.clear,
                                            color: Colors.red,
                                          ),
                                    Text('FaceLock Available'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ffAuthController.hasfingerPrint.value ==
                                            true
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          )
                                        : Icon(
                                            Icons.clear,
                                            color: Colors.red,
                                          ),
                                    Text('FingerPrint Available'),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  width: double.maxFinite,
                                  child: RaisedButton(
                                    onPressed: () =>
                                        ffAuthController.authenticateUser(),
                                    color: Colors.green,
                                    child: Text('Authenticate'),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  child: RaisedButton(
                                    onPressed: () => Get.back(),
                                    color: Colors.green,
                                    child: Text('Go Back'),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      barrierDismissible: false,
                    ),
                // tileColor:
                //     Get.currentRoute == Routes.VIDEOPLAYER ? Colors.blue : null,
                // textIconColor: Get.currentRoute == Routes.VIDEOPLAYER
                //     ? Colors.white
                //     : Colors.black
                  ),
          ],
        ),
      ),
    );
  }




  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.SCROLLPAGE);
    } else if (index == 1) {
      Get.toNamed(Routes.CAROUSEL);
    }
    else if (index == 2) {
      Get.toNamed(Routes.VIDEOPLAYER);
    }if (index == 3) {
      Get.toNamed(Routes.DRAGPAGE);
    }
  }
  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    Color? textIconColor,
    Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }
  Widget buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.grey),
      accountName: Text("Ripples Code"),
      accountEmail: Text("ripplescode@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(controller.imageUrl.value),
      ),
      currentAccountPictureSize: Size.square(72),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text("RC"),
        )
      ],
      otherAccountsPicturesSize: Size.square(50),
    );
  }
}
