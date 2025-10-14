import 'package:intl/intl.dart';

import '../../res/constants/urls.dart';
import '../../res/enums/exercise_status.dart';

extension StringExtension on String {
  /// funds raising donation id
  String get referenceId => substring(0, length ~/ 3).toUpperCase();

  String get completeUrl => isNotEmpty ? "${Urls.baseUrl}$this" : '';
}

extension Pluralize on String {
  String pluralize(int length) =>
      length <= 1 ? '$length $this' : '$length ${this}s';
}

extension StringToDateTime on String {
  DateTime toDateTime() {
    try {
      return DateFormat('yyyy-MM-dd').parseStrict(this);
    } catch (e) {
      //throw FormatException("Error parsing date: $this. $e");
      return DateTime.now();
    }
  }
}

extension SearchWorkOuts on String {
  bool search(String name) {
    if (isEmpty) return true;

    if (name.trim().toLowerCase().contains(trim().toLowerCase())) return true;

    return false;
  }
}

extension TimeStringExtension on String {
  int toSeconds() {
    List<String> timeComponents = split(':');

    if (timeComponents.length != 3) {
      // Invalid time format
      throw FormatException("Invalid time format: $this");
    }

    int hours = int.parse(timeComponents[0]);
    int minutes = int.parse(timeComponents[1]);
    int seconds = int.parse(timeComponents[2]);

    return hours * 3600 + minutes * 60 + seconds;
  }
}



extension StringToRole on String {
  Role toRole() {
    switch (this) {
      case 'Admin':
        return Role.Admin;
      case 'Instructor':
        return Role.Instructor;
      case 'Student':
        return Role.Student;
      default:
        return Role.Student;
    }
  }
}

extension StringToAccountStatus on String {
  AccountStatus toAccountStatus() {
    switch (this) {
      case 'Active':
        return AccountStatus.Active;
      case 'Deleted':
        return AccountStatus.Deleted;
      default:
        return AccountStatus.Active;
    }
  }
}

extension StringToImageStatus on String {
  ImageStatus toImageStatus() {
    switch (this) {
      case "Pending":
        return ImageStatus.Pending;
      case "Approved":
        return ImageStatus.Approved;
      case "Rejected":
        return ImageStatus.Rejected;
      case "Requested":
        return ImageStatus.Requested;
      default:
        return ImageStatus.Pending;
    }
  }
}

extension TimeFormatter on String {
  String formatTime() {
    // Split the time string into hours, minutes, and seconds
    List<String> parts = split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    // Convert 24-hour format to 12-hour format
    String period = (hour < 12) ? 'AM' : 'PM';
    hour = (hour > 12) ? hour - 12 : hour;
    hour = (hour == 0) ? 12 : hour; // Handle midnight

    // Format the time as "hh:mm AM/PM"
    return '$hour:${minute.toString().padLeft(2, '0')} $period';
  }
}