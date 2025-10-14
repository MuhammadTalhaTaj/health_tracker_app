import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../res/constants/imports.dart';

class NutritionController extends GetxController {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<DateTime> weekDays = [];
  int selectedDayIndex = 0; // 0..6 for the shown week
  bool showCalendar = false;

  @override
  void onInit() {
    super.onInit();
    weekDays = _computeWeekDays(selectedDate);
    selectedDayIndex = weekDays.indexWhere((d) => _isSameDate(d, selectedDate));
    if (selectedDayIndex == -1) selectedDayIndex = 0;
  }


  bool isDaytime(DateTime dateTime) {
    final hour = dateTime.hour;
    return hour >= 6 && hour < 18; // Daytime is between 6:00 AM and 5:59 PM
  }
  List<DateTime> _computeWeekDays(DateTime date) {
    final int weekday = date.weekday; // Monday=1 ... Sunday=7
    final DateTime monday = DateTime(date.year, date.month, date.day).subtract(Duration(days: weekday - 1));
    return List.generate(7, (i) {
      final dt = monday.add(Duration(days: i));
      return DateTime(dt.year, dt.month, dt.day);
    });
  }

  int weekOfMonth(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    final firstMonday = firstDay.weekday == DateTime.monday
        ? firstDay
        : firstDay.add(Duration(days: (8 - firstDay.weekday))); // next Monday (could be in same month)
    if (firstMonday.month != date.month) {
      final offset = (firstDay.weekday - 1);
      final weekIndex = ((date.day + offset - 1) / 7).floor() + 1;
      return weekIndex;
    } else {
      final offset = firstDay.weekday - 1;
      final weekIndex = ((date.day + offset - 1) / 7).floor() + 1;
      return weekIndex;
    }
  }

  int totalWeeksInMonth(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    final lastDayNum = DateTime(date.year, date.month + 1, 0).day;
    final offset = firstDay.weekday - 1; // days before first Monday
    final total = ((lastDayNum + offset - 1) / 7).floor() + 1;
    return total;
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String shortDayName(int weekday) {
    const names = ['M', 'Tu', 'W', 'Th', 'F', 'Sa', 'Su'];
    return names[weekday - 1];
  }

  void openCalendarBottomSheet() {
    showCalendar = !showCalendar;
    update();

    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.now().subtract(const Duration(days: 365 * 3)),
                      lastDay: DateTime.now().add(const Duration(days: 365 * 3)),
                      focusedDay: focusedDay,
                      calendarFormat: CalendarFormat.month,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      selectedDayPredicate: (day) => _isSameDate(day, selectedDate),
                      onDaySelected: (day, focused) {
                        // update controller state and close sheet
                        selectDateFromCalendar(day, focused);
                        Navigator.of(context).pop();
                      },
                      headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(color: Colors.tealAccent.withOpacity(0.9), shape: BoxShape.circle),
                        selectedDecoration: BoxDecoration(color: Colors.tealAccent, shape: BoxShape.circle),
                        defaultTextStyle: TextStyle(color: Colors.white70),
                        weekendTextStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      showCalendar = false;
      update();
    });
  }

  void toggleCalendar() {
    showCalendar = !showCalendar;
    if (showCalendar) focusedDay = selectedDate;
    update();
  }

  void selectDateFromCalendar(DateTime day, DateTime focused) {
    selectedDate = DateTime(day.year, day.month, day.day);
    focusedDay = focused;
    weekDays = _computeWeekDays(selectedDate);
    selectedDayIndex = weekDays.indexWhere((d) => _isSameDate(d, selectedDate));
    if (selectedDayIndex == -1) selectedDayIndex = 0;
    update();
  }

  void selectDayFromStrip(DateTime day) {
    selectedDate = DateTime(day.year, day.month, day.day);
    weekDays = _computeWeekDays(selectedDate);
    selectedDayIndex = weekDays.indexWhere((d) => _isSameDate(d, selectedDate));
    if (selectedDayIndex == -1) selectedDayIndex = 0;
    update();
  }

  String formattedReadableDate(DateTime dt) {
    final monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${dt.day} ${monthNames[dt.month - 1]} ${dt.year}';
  }
}
