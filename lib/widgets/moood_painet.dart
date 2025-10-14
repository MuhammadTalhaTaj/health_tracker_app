import 'dart:math';

import 'package:flutter/material.dart';
import 'package:live_score_app/res/constants/imports.dart';
class MoodRingPainter extends CustomPainter {
  final double angle;
  final List<Map<String, dynamic>> moods;

  MoodRingPainter({required this.angle, required this.moods});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.4;
    const strokeWidth = 20.0;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweepGradient = SweepGradient(
      colors: moods.map((m) => m["color"] as Color).toList(),
      stops: List.generate(moods.length, (i) => i / moods.length),
    );

    final paint = Paint()
      ..shader = sweepGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, -pi / 2, 2 * pi, false, paint);

    const knobRadius = 18.0;
    final knobX = center.dx + radius * cos(angle - pi / 2);
    final knobY = center.dy + radius * sin(angle - pi / 2);

    final knobPaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(knobX, knobY), knobRadius, knobPaint);

    final textPainter = TextPainter(
      text: const TextSpan(
        text: "",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(canvas, Offset(knobX - 6, knobY - 8));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
