double convertRunTime(Duration timer) {
  String seconds = '${timer.inSeconds}';
  String microSeconds = '${timer.inMicroseconds / 1000000}'.substring(2);
  return double.parse('$seconds.$microSeconds');
}
