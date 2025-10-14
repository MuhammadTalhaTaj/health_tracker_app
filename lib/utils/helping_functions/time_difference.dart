String calculateTimeDifference(String startTime, String endTime) {
  List<String> startParts = startTime.split(':');
  List<String> endParts = endTime.split(':');

  int startHour = int.parse(startParts[0]);
  int startMinute = int.parse(startParts[1]);

  int endHour = int.parse(endParts[0]);
  int endMinute = int.parse(endParts[1]);

  DateTime startDateTime = DateTime(2000, 1, 1, startHour, startMinute);
  DateTime endDateTime = DateTime(2000, 1, 1, endHour, endMinute);

  Duration difference = endDateTime.difference(startDateTime);

  if (difference.inHours > 0) {
    return "${difference.inHours} hours";
  } else {
    return "${difference.inMinutes} minutes";
  }
}