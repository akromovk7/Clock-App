import 'package:intl/intl.dart';

class TimeUtils {
  static String formatToMyTimeDay(DateTime dateTime) {
    final format = DateFormat.d().format(dateTime).toString();
    return format;
  }
  static String formatToMyTimeWeek(DateTime dateTime) {
    final format = DateFormat.EEEE().format(dateTime).toString();
    return format;
  }
  static String formatToMyTimeMonth(DateTime dateTime) {
    final format = DateFormat.LLLL().format(dateTime).toString();
    return format;
  }
}