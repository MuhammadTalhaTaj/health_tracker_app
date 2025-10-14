import 'package:flutter/material.dart';
import 'package:live_score_app/widgets/hydritation%20cart.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../res/constants/imports.dart';
import '../../gen/assets.gen.dart';
import '../../view_models/nurtition_view_model/nutrition_controller.dart';
import '../../widgets/calander_date_widget.dart';
import '../../widgets/calories_card.dart';
import '../../widgets/weight_card.dart';
import '../../widgets/workout_card.dart';

class NutritionView extends StatelessWidget {
  const NutritionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NutritionController>(
      init: Get.put(NutritionController()),
      builder: (controller) {
        final currentWeekIndex = controller.weekOfMonth(
          controller.selectedDate,
        );
        final totalWeeks = controller.totalWeeksInMonth(
          controller.selectedDate,
        );

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            Assets.icons.notification,
                            height: 25,
                            width: 25,
                          ),
                        ),
                
                        GestureDetector(
                          onTap: () => controller.openCalendarBottomSheet(),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.icons.weekIcon,
                                width: 25,
                                color: context.grey,
                              ),
                              6.w,
                              Text(
                                'Week $currentWeekIndex/$totalWeeks',
                                style: context.bodyMedium,
                              ),
                              6.w,
                              Icon(
                                controller.showCalendar
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                size: 18,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ),
                        Container(),
                      ],
                    ),
                
                    14.h,
                
                    Text(
                      'Today, ${controller.formattedReadableDate(controller.selectedDate)}',
                      style: context.bodyMedium,
                    ),
                
                    8.h,
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.weekDays.length,
                        itemBuilder: (context, idx) {
                          final dt = controller.weekDays[idx];
                          final bool selected =
                              controller.selectedDate.year == dt.year &&
                              controller.selectedDate.month == dt.month &&
                              controller.selectedDate.day == dt.day;
                          return GestureDetector(
                            onTap: () => controller.selectDayFromStrip(dt),
                            child: CalenderDateWidget(
                              dt: dt,
                              selected: selected,
                              controller: controller,
                            ),
                          );
                        },
                      ),
                    ),
                    14.h,
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Workouts", style: context.headlineMedium),
                        Row(
                          children: [
                           controller.isDaytime(DateTime.now())?Assets.icons.sunPng.image(height: 20,width: 20,color: context.primary):Assets.icons.moon.image(height: 20,width: 20,color: context.primary),
                            6.w,
                            Text('9', style: context.bodyMedium),
                          ],
                        ),
                      ],
                    ),
                    12.h,
                    WorkoutCard(
                      title: 'Upper Body',
                      subtitle: 'December 22 - 25m • 30m',
                      onTap: () {},
                    ),
                
                    16.h,
                
                    Text('My Insights', style: context.headlineMedium),
                    16.h,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: CaloriesCard(total: 2500, remaining: 1950)),
                        12.w,
                        Expanded(child: WeightCard(weightKg: 75, delta: 1.6)),
                      ],
                    ),
                           
                    16.h,
                    HydrationCard(
                      progress: 0.0,
                      totalLiters: 2.0,
                      currentMl: 0.0,
                    ),
                 26.h,
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



