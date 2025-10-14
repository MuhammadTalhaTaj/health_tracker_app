import 'package:intl/intl.dart';

import '../../res/constants/imports.dart';

extension FormattedDate on DateTime {
  String formatDate() {
    final formatter = DateFormat.yMMMMd();
    return formatter.format(this);
  }

  String toFormattedTime() {
    return DateFormat('hh:mm a').format(this.toLocal());
  }


  int monthsPassed(DateTime other) {
    int totalDays = other.difference(this).inDays;
    int monthDiff = (totalDays/30).toInt();
    int days = totalDays%30;
    print('Total Days: $totalDays');
    print('Month difference: $monthDiff');
    print('Remaining days: $days');

    if(monthDiff>0 && days>1){
      monthDiff++;
    }

    print('month returned: $monthDiff');
    return monthDiff;
  }

  String formatAttendanceDate() {
    final formatter = DateFormat('M/d/yyyy');
    return formatter.format(this);
  }
}

extension CovertToDate on String {
  DateTime fromFormattedDate() {
    final formatter = DateFormat.yMMMMd();
    return formatter.tryParse(this) ?? DateTime.now();
  }

  DateTime toDateFromAttendanceFormat() {
    final formatter = DateFormat('M/d/yyyy');
    return formatter.tryParse(this) ?? DateTime.now();
  }
}

extension FormatTimeOfDay on TimeOfDay {
  String formatTime() {
    final hour = hourOfPeriod;
    final minute = this.minute.toString().padLeft(2, '0');
    final period = this.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}

extension StringDateFormatter on String {
  String toFormattedDate() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('dd MMM yyyy').format(dateTime).toString();
  }
}

extension TimeOfDayFormatter on TimeOfDay {
  String toFormattedTime() {
    final hour =
        hourOfPeriod == 0 ? 12 : hourOfPeriod; // Convert 0 to 12 for AM
    final minute = this.minute.toString().padLeft(2, '0');
    final period = this.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}
