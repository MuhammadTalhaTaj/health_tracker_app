import 'package:get/get.dart';

class TrainingCalendarController extends GetxController {
  final weeks = [
    {
      'week': 'Week 2/8',
      'dateRange': 'December 8–14',
      'total': '60min',
      'days': [
        {
          'day': 'Mon',
          'date': '8',
          'workout': {
            'title': 'Arm Blaster',
            'duration': '25m – 30m',
            'tag': 'Arms Workout',
            'color': 0xFF20B76F,
          }
        },
        {
          'day': 'Thu',
          'date': '11',
          'workout': {
            'title': 'Leg Day Blitz',
            'duration': '25m – 30m',
            'tag': 'Leg Workout',
            'color': 0xFF3498DB,
          }
        },
      ],
    },
  ];

// future expansion for dynamic weeks
}
