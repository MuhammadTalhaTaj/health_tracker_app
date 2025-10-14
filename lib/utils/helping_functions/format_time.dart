String formatTime(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}


int parseTimeGetSeconds(String formattedTime) {
  List<String> parts = formattedTime.split(':');
  int minutes = int.parse(parts[0]);
  int seconds = int.parse(parts[1]);
  return (minutes * 60) + seconds;
}