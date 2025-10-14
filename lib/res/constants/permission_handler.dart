//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../widgets/custom_dialog.dart';
//
// class PermissionHandler {
//   static Future<bool> permission({required Permission permission}) async {
//     PermissionStatus permissionStatus = await permission.status;
//     if (permissionStatus == PermissionStatus.granted || permissionStatus ==PermissionStatus.limited) return true;
//
//     if (permissionStatus == PermissionStatus.denied) {
//       permissionStatus = await permission.request();
//
//       if (permissionStatus == PermissionStatus.granted) return true;
//
//       if (permissionStatus == PermissionStatus.permanentlyDenied) {
//         await showOpenAppSettingsDialog(
//             description: permission.toString().split('.').last.toString());
//         await Future.delayed(const Duration(seconds: 5));
//         permissionStatus = await permission.status;
//         if (permissionStatus == PermissionStatus.granted) return true;
//         return false;
//       }
//       return false;
//     }
//
//     if (permissionStatus == PermissionStatus.permanentlyDenied) {
//       await showOpenAppSettingsDialog(
//           description: permission.toString().split('.').last.toString());
//
//       await Future.delayed(const Duration(seconds: 5));
//       if (permissionStatus == PermissionStatus.granted) return true;
//
//       return false;
//     }
//     if (permissionStatus == PermissionStatus.limited ||
//         permissionStatus == PermissionStatus.restricted) {
//       showOpenAppSettingsDialog(
//           description: permission.toString().split('.').last.toString());
//       await Future.delayed(const Duration(seconds: 5));
//       if (permissionStatus == PermissionStatus.granted) return true;
//
//       return false;
//     }
//     return false;
//   }
//
//   static Future<void> showOpenAppSettingsDialog({String? description}) async {
//     await Get.dialog(
//       CustomDialog(
//         title: 'Permission needed',
//         description:
//             "Cocoon app to access this device's  ${description ?? ""} ?",
//         button1: 'Cancel',
//         button2: 'Open Setting',
//         descriptionTextAlign: TextAlign.start,
//         tap2: () async {
//           await openAppSettings();
//           Get.back();
//         },
//         tap1: () {
//           Get.back();
//         },
//       ),
//     );
//   }
// }
