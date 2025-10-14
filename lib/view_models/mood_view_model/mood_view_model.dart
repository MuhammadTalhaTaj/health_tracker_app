import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class MoodController extends GetxController {
  double angle = 0;

  final List<Map<String, dynamic>> moods = [
    {"emoji": Assets.icons.peaceful.path, "label": "Peaceful", "color": Color(0xffED8CB1),},
    {"emoji":Assets.icons.content.path, "label": "Content", "color": Color(0xffC9BBEF)},
    {"emoji": Assets.icons.calm.path, "label": "Calm", "color": Color(0xff6EB9AD)},
    {"emoji": Assets.icons.happy.path, "label": "Happy", "color": Color(0xffFA9E5D)},
  ];

  int get currentMoodIndex {
    final segmentAngle = 2 * pi / moods.length;
    return (angle ~/ segmentAngle) % moods.length;
  }

  void updateAngle(Offset localPos, double screenWidth) {
    final center = screenWidth / 2;
    final dx = localPos.dx - center;
    final dy = localPos.dy - 250; // Y-offset from top
    final newAngle = atan2(dy, dx) + pi / 2;

    angle = (newAngle + 2 * pi) % (2 * pi);
    update(); // triggers GetBuilder rebuild
  }
}
