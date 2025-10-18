import 'dart:math';
import 'package:flutter/material.dart';
import 'package:live_score_app/res/constants/imports.dart';

import '../../view_models/mood_view_model/mood_view_model.dart';
import '../../widgets/moood_painet.dart';

class MoodView extends StatelessWidget {
  const MoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoodController>(
      init: MoodController(),
      builder: (controller) {
        final mood = controller.moods[controller.currentMoodIndex];
        final emoji = mood["emoji"];
        final label = mood["label"];
        return Scaffold(
          backgroundColor: context.scaffoldBackgroundColor,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff394E7B),
                    context.scaffoldBackgroundColor,
                    context.scaffoldBackgroundColor,
                    context.scaffoldBackgroundColor,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mood",
                      style: context.displayMedium?.copyWith(
                        color: context.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Start your day",
                      style: context.bodyLarge?.copyWith(
                        color: context.primary,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "How are you feeling at the\nMoment?",
                      textAlign: TextAlign.start,
                      style: context.titleMedium?.copyWith(
                        color: context.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 40),

                    Center(
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          controller.updateAngle(
                            details.localPosition,
                            context.width,
                          );
                        },
                        child: CustomPaint(
                          painter: MoodRingPainter(
                            angle: controller.angle,
                            moods: controller.moods,
                          ),
                          child: SizedBox(
                            height: 250,
                            width: 250,
                            child: Center(
                              child: Image.asset(emoji, height: 80, width: 80),
                            ),
                          ),
                        ),
                      ),
                    ),
                    12.h,
                    Center(
                      child: Text(
                        label,
                        style: context.headlineMedium?.copyWith(
                          color: context.primary,
                        ),
                      ),
                    ),
                    Spacer(),
                    AppButton.primary(
                      title: "Continue",

                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
