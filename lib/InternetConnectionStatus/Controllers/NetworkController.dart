import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../app/routes/app_pages.dart';

class NetworkController extends GetxController {
  var connectionStatus = 0.obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectionSubscription;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initConnectivity();
    connectionSubscription =
        connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return updateConnectionStatus(result!);
  }

  updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 2;
        Get.snackbar('Network Connection Changed', 'Connected to Wifi');
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 1;
        Get.snackbar(
            'Network Connection Changed', 'Connected to Mobile Internet');
        break;
      case ConnectivityResult.ethernet:
        connectionStatus.value = 3;
        Get.snackbar('Network Connection Changed', 'Connected to Ethernet');
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        Get.snackbar('Connection Lost', 'No Connected to Internet');
        break;
      default:
        Get.snackbar('Network Error', 'failed to get network connection.');
        break;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    connectionSubscription.cancel();
  }
}
