import 'package:flutter/material.dart';

mixin DateTimeMixin {
  Future<DateTime?> pickDate(BuildContext context, {DateTime? firstDate, DateTime? lastDate}) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate ?? DateTime.now().subtract(const Duration(days: 365)),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
    );

    return selectedDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return selectedTime;
  }
}
