import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class FFAuthControl extends GetxController {
  LocalAuthentication _localAuth = LocalAuthentication();
  var hasfingerPrint = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuthenticated = false.obs;

  void _getAllBiometrics() async {
    //Check whether there is local authentication available on this device or not
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;
    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometrics =
          await _localAuth.getAvailableBiometrics();
      hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
      hasfingerPrint.value =
          availableBiometrics.contains(BiometricType.fingerprint);
    } else {
      Get.snackbar('Error', 'Local Authentication not available',
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void authenticateUser() async {
    try {
      const androidMessage = AndroidAuthMessages(
        cancelButton: 'Cancel',
        goToSettingsButton: 'settings',
        goToSettingsDescription: 'Please set up your FingerPrint/Face.',
        biometricHint: 'Verify your identity',
      );
      isUserAuthenticated.value = await _localAuth.authenticate(
        localizedReason: 'Authenticate Yourself',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: false,
        androidAuthStrings: androidMessage,
      );
      if (isUserAuthenticated.value) {
        Get.snackbar('Success', 'You are authenticated',
            backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', 'Authentication Cancelled',
            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print('------------------------------------------' + e.toString());
      Get.snackbar('Error', '$e',
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getAllBiometrics();
  }
}
//
// // 2. created object of localauthentication class
// final LocalAuthentication _localAuthentication = LocalAuthentication();
// // 3. variable for track whether your device support local authentication means
// //    have fingerprint or face recognization sensor or not
// bool _hasFingerPrintSupport = false;
// // 4. we will set state whether user authorized or not
// String _authorizedOrNot = "Not Authorized";
// // 5. list of avalable biometric authentication supports of your device will be saved in this array
// List<BiometricType> _availableBuimetricType = List<BiometricType>();
//
// Future<void> _getBiometricsSupport() async {
//   // 6. this method checks whether your device has biometric support or not
//   bool hasFingerPrintSupport = false;
//   try {
//     hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
//   } catch (e) {
//     print(e);
//   }
//   if (!mounted) return;
//   setState(() {
//     _hasFingerPrintSupport = hasFingerPrintSupport;
//   });
// }
//
// Future<void> _getAvailableSupport() async {
//   // 7. this method fetches all the available biometric supports of the device
//   List<BiometricType> availableBuimetricType = List<BiometricType>();
//   try {
//     availableBuimetricType =
//     await _localAuthentication.getAvailableBiometrics();
//   } catch (e) {
//     print(e);
//   }
//   if (!mounted) return;
//   setState(() {
//     _availableBuimetricType = availableBuimetricType;
//   });
// }
//
// Future<void> _authenticateMe() async {
//   // 8. this method opens a dialog for fingerprint authentication.
//   //    we do not need to create a dialog nut it popsup from device natively.
//   bool authenticated = false;
//   try {
//     authenticated = await _localAuthentication.authenticateWithBiometrics(
//       localizedReason: "Authenticate for Testing", // message for dialog
//       useErrorDialogs: true,// show error in dialog
//       stickyAuth: true,// native process
//     );
//   } catch (e) {
//     print(e);
//   }
//   if (!mounted) return;
//   setState(() {
//     _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";
//   });
// }
//
// @override
// void initState() {
//   _getBiometricsSupport();
//   _getAvailableSupport();
//   super.initState();
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(widget.title),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text("Has FingerPrint Support : $_hasFingerPrintSupport"),
//           Text(
//               "List of Biometrics Support: ${_availableBuimetricType.toString()}"),
//           Text("Authorized : $_authorizedOrNot"),
//           RaisedButton(
//             child: Text("Authorize Now"),
//             color: Colors.green,
//             onPressed: _authenticateMe,
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
