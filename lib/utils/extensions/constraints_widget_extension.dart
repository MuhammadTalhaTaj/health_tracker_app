import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

extension WidgetExtension on Widget {}

extension ContainerWidthExtension on int {
  double? getContainerWidth(int listLength) {
    return listLength == this + 1 && listLength % 2 != 0
        ? Get.width
        : Get.width * 0.425;
  }
}
