import 'dart:io';
import 'package:uuid/uuid.dart';

class Utils {
  Utils._();

  static String getNewUuid() {
    return const Uuid().v1();
  }

  static DateTime timeNow() {
    return DateTime.now();
  }

  static String convertTimeToString(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }

  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }
}
