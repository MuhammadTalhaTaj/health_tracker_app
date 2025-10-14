// import 'dart:io';
//
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../res/constants/app_colors.dart';
// import '../../res/constants/imports.dart';
// import '../../res/constants/permission_handler.dart';
//
//
//
// mixin ImagePickerMixin {
//   Future<File?> pickImage({required bool isCamera}) async {
//     final ImagePicker picker = ImagePicker();
//     File? imageFile;
//     XFile? pickedFile;
//
//     bool allowed = true;
//
//     if (isCamera) {
//       allowed = await Permission.camera.request().isGranted;
//     } else if (Platform.isIOS) {
//       allowed = await Permission.photos.request().isGranted;
//     }
//
//     if (!allowed) return null;
//
//     pickedFile = await picker.pickImage(
//       source: isCamera ? ImageSource.camera : ImageSource.gallery,
//     );
//
//     if (pickedFile == null) return null;
//
//     // Ask user if they want cropping
//     bool wantCrop = false;
//     await showDialog(
//       context: Get.context!,
//       builder: (context) => AlertDialog(
//         title: Text('You want to crop the image?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               wantCrop = true;
//               Get.back();
//             },
//             child: Text('Yes', style: TextStyle(color: context.primary)),
//           ),
//           TextButton(
//             onPressed: () {
//               wantCrop = false;
//               Get.back();
//             },
//             child: Text('No', style: TextStyle(color: context.primary)),
//           ),
//         ],
//       ),
//     );
//
//     if (wantCrop) {
//       return await _cropImage(pickedFile);
//     } else {
//       return File(pickedFile.path);
//     }
//   }
//
//   Future<File?> _cropImage(XFile? pickedFile) async {
//     if (pickedFile == null) return null;
//
//     File? imageFile;
//
//     CroppedFile? croppedFile = await ImageCropper().cropImage(
//       sourcePath: pickedFile.path,
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: AppColors.primary,
//             toolbarWidgetColor: AppColors.white,
//             activeControlsWidgetColor: AppColors.black,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false,
//             aspectRatioPresets: [
//               CropAspectRatioPreset.square,
//               CropAspectRatioPreset.ratio3x2,
//               CropAspectRatioPreset.original,
//               CropAspectRatioPreset.ratio4x3,
//               CropAspectRatioPreset.ratio16x9
//             ]),
//         IOSUiSettings(title: 'Cropper', aspectRatioPresets: [
//           CropAspectRatioPreset.original,
//           CropAspectRatioPreset.square,
//           CropAspectRatioPreset.ratio3x2,
//           CropAspectRatioPreset.ratio4x3,
//           CropAspectRatioPreset.ratio5x3,
//           CropAspectRatioPreset.ratio5x4,
//           CropAspectRatioPreset.ratio7x5,
//           CropAspectRatioPreset.ratio16x9
//         ]),
//       ],
//     );
//
//     if (croppedFile != null) {
//       File? file = File(croppedFile.path);
//       imageFile = file;
//     }
//     return imageFile;
//   }
// }
//
