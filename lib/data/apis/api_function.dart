// // ignore_for_file: constant_identifier_names
//
// import 'dart:convert';
// import 'package:../res/constants/imports.dart';
// import 'package:../view_models/models/user_controller/user_controller.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
//
// import '../../models/base_model.dart';
// import '../../res/constants/app_colors.dart';
// import '../../res/constants/imports.dart';
// import '../../res/constants/urls.dart';
// import '../../utils/extensions/build_context_extension.dart';
// import '../../view/auth/login/login.dart';
//
// const String GET = "GET";
// const String POST = "POST";
// const String PUT = "PUT";
// const String UPDATE = "UPDATE";
// const String DELETE = "DELETE";
// const String PATCH = "PATCH";
//
// Future<dynamic> apiCall<T>(
//     String method,
//     String endPoint,
//     var dataMap, {
//       T Function(Map<String, dynamic>)? fromJson,
//       bool showLoader = true,
//       File? file,
//       bool isFormData = false,
//       String? fileKey,
//       bool showSuccessMessage = false,
//       bool showErrorMessage = true,
//       bool useBaseModel = true,
//     }) async {
//   if (showLoader) Get.dialog(const CustomLoader());
//
//   UserModel userData = Get.find<UserController>().userData.value;
//   final String url = "${Urls.baseUrl}$endPoint";
//
//   // log(userData.token);
//
//   if (!await _checkInternetConnectivity()) {
//     showSnackBar('No internet connection');
//     Get.back();
//     return false;
//   }
//
//   try {
//     var headers = {
//       "Authorization": "Bearer ${userData.token}",
//       "Content-Type": "application/json"
//     };
//
//     var request;
//
//       debugPrint(userData.token);
//
//
//     if (isFormData) {
//       request = http.MultipartRequest(method, Uri.parse(url));
//
//       dataMap.forEach((key, value) {
//         request.fields[key] = value.toString();
//       });
//       if (file != null) {
//         request.files.add(
//           await http.MultipartFile.fromPath(fileKey ?? "", file.path),
//         );
//       }
//     } else {
//       request = http.Request(method, Uri.parse(url));
//
//       request.body = jsonEncode(dataMap);
//     }
//     request.headers.addAll(headers);
//
//     debugPrint("Url: $url\nInput Data: ${json.encode(dataMap)}");
//     http.StreamedResponse response = await request.send();
//
//     debugPrint("status: ${response.statusCode}");
//     String? data = await response.stream.bytesToString();
//     debugPrint("Response Data: $data");
//
//     if (response.statusCode == 401 ) {
//       Get.back();
//       Get.offAll(() =>  LoginPage());
//       storageBox.erase();
//       Get.find<UserController>().userData.value = UserModel();
//       return null;
//     }
//
//     final decodedResponse = json.decode(data);
//
//     if (useBaseModel) {
//       final BaseModel baseModel = BaseModel.fromJson(decodedResponse);
//
//       if ((response.statusCode == 200 || response.statusCode == 201) &&
//           (baseModel.status ?? false)) {
//         var result;
//
//         if (baseModel.data != null && fromJson != null) {
//           if (baseModel.data is List) {
//             result = baseModel.data.map((e) => fromJson(e)).toList();
//           } else {
//             result = fromJson(baseModel.data);
//           }
//         }
//
//         if (showLoader) Get.back();
//         if (showSuccessMessage) showSuccessfulToastMessage(baseModel.message??'');
//         return result ?? baseModel.data ?? baseModel.status ?? false;
//       }
//
//       if (showLoader) Get.back();
//       if (showErrorMessage) {
//         showSnackBar(baseModel.message, backgroundColor: AppColors.red);
//       }
//       return false;
//     } else {
//       var result;
//
//       if ((response.statusCode == 200 || response.statusCode == 201) &&
//           fromJson != null) {
//         if (decodedResponse is List) {
//           result = decodedResponse.map((e) => fromJson(e)).toList();
//         } else {
//           result = fromJson(decodedResponse);
//         }
//       }
//
//       if (showLoader) Get.back();
//       if (showSuccessMessage) showSnackBar("Request successful");
//       return result ?? decodedResponse;
//     }
//   } catch (e) {
//     if (showLoader) Get.back();
//     debugPrint("error: $e");
//     if (showErrorMessage) showSnackBar(e.toString());
//     return null;
//   }
// }
//
// void showSnackBar(String? message, {Color backgroundColor = Colors.redAccent}) {
//   ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
//   final snackBar = SnackBar(
//     content: Text(message ?? ""),
//     backgroundColor: backgroundColor,
//
//   );
//   ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
// }
//
// Future<bool> _checkInternetConnectivity() async {
//   // bool hasInternet = false;
//   // final connectivityResult = await Connectivity().checkConnectivity();
//   // if (connectivityResult == ConnectivityResult.none) {
//   //   return hasInternet;
//   // }
//   // return await InternetConnectionChecker().hasConnection;
//   return Future.value(true);
// }
