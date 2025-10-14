
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MyFilePicker{


  static Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.gallery,

    );
      if (img == null) return null;
      return File(img.path); // convert it to a Dart:io file
  }


  static Future<File?> takeImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (img == null) return null;
    return File(img.path); // convert it to a Dart:io file
  }



  static Future<File?> pickVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (img == null) return null;
    return File(img.path); // convert it to a Dart:io file
  }



}