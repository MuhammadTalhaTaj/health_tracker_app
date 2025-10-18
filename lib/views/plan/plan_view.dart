import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/extensions/build_context_extension.dart';
import '../../view_models/plan_view_model/plan_controller.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingCalendarController>(
      init: TrainingCalendarController(),
      builder: (controller) {
        final week = controller.weeks.first;

        return Scaffold(
          backgroundColor: context.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: context.scaffoldBackgroundColor,
            elevation: 0,
            title: Text(
              'Training Calendar',
              style: context.titleMedium?.copyWith(color: context.primary),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: context.bodyMedium?.copyWith(color: context.secondary),
                ),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.blue, width: 1.5),
                    bottom: BorderSide(
                      color: context.cardColor.withOpacity(0.6),
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          week['week'] as String,
                          style: context.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          week['dateRange'] as String,
                          style: context.bodySmall?.copyWith(
                            color: context.grey,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Total: ${week['total']}",
                      style: context.bodySmall?.copyWith(color: context.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Days list
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final days = [
                      "Mon",
                      "Tue",
                      "Wed",
                      "Thu",
                      "Fri",
                      "Sat",
                      "Sun",
                    ];
                    final weekData = week['days'] as List;
                    final workout = weekData.firstWhereOrNull(
                      (d) => d['day'] == days[index],
                    );

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Day and date
                              SizedBox(
                                width: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      days[index],
                                      style: context.bodySmall?.copyWith(
                                        color: context.grey,
                                      ),
                                    ),
                                    if (workout != null)
                                      Text(
                                        workout['date'].toString(),
                                        style: context.bodySmall?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: context.primary,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Workout Card
                              if (workout != null)
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: context.grey,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: context.cardColor,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 6,
                                                          vertical: 2,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: Color(
                                                        workout['workout']['color'],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      workout['workout']['tag'],
                                                      style: context
                                                          .bodyExtraSmall
                                                          ?.copyWith(
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                    workout['workout']['title'],
                                                    style: context.bodyMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              context.primary,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                workout['workout']['duration'],
                                                style: context.bodySmall
                                                    ?.copyWith(
                                                      color: context.grey,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const Divider(thickness: 0.3),
                      ],
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: context.secondary, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Week 2",
                      style: context.bodyMedium?.copyWith(
                        color: context.primary,
                      ),
                    ),
                    Text(
                      "December 14–22",
                      style: context.bodySmall?.copyWith(color: context.grey),
                    ),
                    Text(
                      "Total: 60min",
                      style: context.bodySmall?.copyWith(color: context.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
