//Convert DateTime object to a string yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  //Year in the formaat -> yyyy
  String year = dateTime.year.toString();

  //Month in the format -> mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0' + month;
  }

  //Day in the fromat -> dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0' + day;
  }

  //Final format -> yyyymmdd
  String yyyymmdd = year + month + day;
  return yyyymmdd;
}
