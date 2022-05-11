import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get getUniqueId {
    return toIso8601String();
  }

  String get getDateString {
    return DateFormat.yMEd().format(this);
  }
}
