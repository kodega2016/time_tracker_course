import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get getUniqueId {
    return toIso8601String();
  }

  String get getDateString {
    return DateFormat.yMMMEd().format(this);
  }

  String get getDateStringMonth {
    return DateFormat.MMMEd().format(this);
  }
}
