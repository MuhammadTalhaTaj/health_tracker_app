import 'package:intl/intl.dart';

extension StringTimestampDescription on String {
  String get dateDifference {
    try {
      // Parse the string timestamp
      final dateTime = DateTime.parse(this).toUtc();

      // Get the current UTC date and time
      final now = DateTime.now().toUtc();

      // Strip the time part from both dates for correct "Today" comparison
      final nowDateOnly = DateTime(now.year, now.month, now.day);
      final dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);

      final difference = nowDateOnly.difference(dateOnly);

      // Calculate the difference in days, weeks, months, and years
      final days = difference.inDays;
      final weeks = days ~/ 7;
      final months = (now.year - dateTime.year) * 12 + now.month - dateTime.month;
      final years = now.year - dateTime.year;

      // Format the exact time if needed
      final timeFormatter = DateFormat('h:mm a');
      final formattedTime = timeFormatter.format(dateTime);

      // Determine the description based on the difference
      if (days == 0) {
        return 'Today at $formattedTime';
      } else if (days < 7) {
        return '$days day${days > 1 ? 's' : ''} ago at $formattedTime';
      } else if (weeks < 4) {
        return '$weeks week${weeks > 1 ? 's' : ''} ago at $formattedTime';
      } else if (months < 12) {
        return '$months month${months > 1 ? 's' : ''} ago at $formattedTime';
      } else {
        return DateFormat('dd MMM yyyy').format(dateTime);
      }
    } catch (e) {
      return 'Invalid Date';
    }
  }


  String get dateDifferenceNonPrecise {
    try {
      // Parse the string timestamp
      final dateTime = DateTime.parse(this).toUtc();

      // Get the current UTC date and time
      final now = DateTime.now().toUtc();
      final difference = now.difference(dateTime);

      // Calculate the difference in days, weeks, months, and years
      final days = difference.inDays;
      final weeks = days ~/ 7;

      // Calculate months correctly
      int months = (now.year - dateTime.year) * 12 + now.month - dateTime.month;
      if (now.day < dateTime.day) {
        months--; // Subtract one if the full month hasn't completed yet
      }

      // Calculate years correctly
      int years = now.year - dateTime.year;
      if (now.month < dateTime.month || (now.month == dateTime.month && now.day < dateTime.day)) {
        years--; // Subtract one if the full year hasn't completed yet
      }

      // Format the exact time if needed
      final timeFormatter = DateFormat('h:mm a');
      final formattedTime = timeFormatter.format(dateTime);

      // Determine the description based on the difference
      if (days == 0) {
        return 'Today at $formattedTime';
      } else if (days < 7) {
        return '$days day${days > 1 ? 's' : ''} old';
      } else if (weeks < 4) {
        return '$weeks week${weeks > 1 ? 's' : ''} old';
      } else if (months < 12) {
        return '$months month${months > 1 ? 's' : ''} old';
      } else {
        return '$years year${years > 1 ? 's' : ''} old';
      }
    } catch (e) {
      return 'Invalid Date';
    }
  }

}
