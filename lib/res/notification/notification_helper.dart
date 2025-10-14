// import 'dart:convert';
// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import '../constants/imports.dart';
//
// class NotificationHelper {
//   static Future<void> initialize(
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     var androidInitialize =
//         const AndroidInitializationSettings('notification_icon');
//     var iOSInitialize = const DarwinInitializationSettings();
//     var initializationsSettings =
//         InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
//     flutterLocalNotificationsPlugin.initialize(initializationsSettings);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       debugPrint(
//           "onMessage: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
//       showNotification(message, flutterLocalNotificationsPlugin, false);
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       debugPrint(
//           "onMessageOpenedApp: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
//       showNotification(message, flutterLocalNotificationsPlugin, false);
//     });
//   }
//
//   static Future<void> showNotification(RemoteMessage message,
//       FlutterLocalNotificationsPlugin fln, bool data) async {
//     String? title;
//     String? body;
//     String? orderID;
//     String? image;
//     String? type = '';
//
//     if (data) {
//       title = message.data['title'];
//       body = message.data['body'];
//       orderID = message.data['order_id'];
//       image =
//           (message.data['image'] != null && message.data['image'].isNotEmpty)
//               ? message.data['image'].startsWith('http')
//                   ? message.data['image']
//                   : '${Urls.baseUrl}${message.data['image']}'
//               : null;
//     } else {
//       title = message.notification!.title;
//       body = message.notification!.body;
//       orderID = message.notification!.titleLocKey;
//       if (Platform.isAndroid) {
//         image = (message.notification!.android!.imageUrl != null &&
//                 message.notification!.android!.imageUrl!.isNotEmpty)
//             ? message.notification!.android!.imageUrl!.startsWith('http')
//                 ? message.notification!.android!.imageUrl
//                 : '${Urls.baseUrl}/storage/app/public/notification/${message.notification!.android!.imageUrl}'
//             : null;
//       } else if (Platform.isIOS) {
//         image = (message.notification!.apple!.imageUrl != null &&
//                 message.notification!.apple!.imageUrl!.isNotEmpty)
//             ? message.notification!.apple!.imageUrl!.startsWith('http')
//                 ? message.notification!.apple!.imageUrl
//                 : '${Urls.baseUrl}/storage/app/public/notification/${message.notification!.apple!.imageUrl}'
//             : null;
//       }
//     }
//
//     if (message.data['type'] != null) {
//       type = message.data['type'];
//     }
//
//     Map<String, String> payloadData = {
//       'title': '$title',
//       'body': '$body',
//       'order_id': '$orderID',
//       'image': '$image',
//       'type': '$type',
//     };
//
//     PayloadModel payload = PayloadModel.fromJson(payloadData);
//
//     await showBigTextNotification(payload, fln);
//   }
//
//   static Future<void> showBigTextNotification(
//       PayloadModel payload, FlutterLocalNotificationsPlugin fln) async {
//     BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//       payload.body!,
//       htmlFormatBigText: true,
//       contentTitle: payload.title,
//       htmlFormatContentTitle: true,
//     );
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       AppStrings.appName,
//       AppStrings.appName,
//       importance: Importance.max,
//       styleInformation: bigTextStyleInformation,
//       priority: Priority.max,
//       playSound: true,
//       // sound: const RawResourceAndroidNotificationSound('notification'),
//     );
//
//     NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await fln.show(0, payload.title, payload.body, platformChannelSpecifics,
//         payload: jsonEncode(payload.toJson()));
//   }
// }
//
// Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
//   debugPrint(
//       "onBackground: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
// }
//
// class PayloadModel {
//   PayloadModel({
//     this.title,
//     this.body,
//     this.image,
//     this.type,
//   });
//
//   String? title;
//   String? body;
//   String? image;
//   String? type;
//
//   factory PayloadModel.fromRawJson(String str) =>
//       PayloadModel.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory PayloadModel.fromJson(Map<String, dynamic> json) => PayloadModel(
//         title: json["title"],
//         body: json["body"],
//         image: json["image"],
//         type: json["type"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "body": body,
//         "image": image,
//         "type": type,
//       };
// }
