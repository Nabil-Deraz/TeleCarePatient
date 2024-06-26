String time24To12HoursConvert(String time) {
  // ignore: unnecessary_null_comparison
  if (time != null) {
    final List<String> timeArray = time.split(":");
    int hour = int.parse(timeArray[0]);
    final int minute = int.parse(timeArray[1]);
    String timeType = "AM";

    if (hour > 12) {
      timeType = "PM";
      hour -= 12;
    } else if (hour == 12) {
      timeType = "PM";
    } else if (hour == 0) {
      hour = 12;
    }

    return "$hour:${minute.toString().padLeft(2, '0')} $timeType";
  }
  return "";
}
