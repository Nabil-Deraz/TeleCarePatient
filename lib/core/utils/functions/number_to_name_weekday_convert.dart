String numberToWeekdayConverter(String date) {
  DateTime parsedDate = DateTime.parse(date);
  switch (parsedDate.weekday) {
    case 1:
      return "Mon";
    case 2:
      return "Tues";
    case 3:
      return "Wednes";
    case 4:
      return "Thurs";
    case 5:
      return "Fri";
    case 6:
      return "Sat";
    case 7:
      return "Sun";
    default:
      return "";
  }
}
