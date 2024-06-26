String dateToDayConverter(String date) {
  DateTime parsedDate = DateTime.parse(date);
  return parsedDate.day.toString();
}
