import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get getUniqueId {
    return toIso8601String();
  }

  String getDateString() {
    return DateFormat('MM/dd/yyyy').format(this);
  }
}
