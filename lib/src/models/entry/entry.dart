import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
class Entry with _$Entry {
  const Entry._();
  factory Entry({
    required String id,
    required String jobId,
    required DateTime start,
    required DateTime end,
    String? comment,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  double get durationInHour => end.difference(start).inMinutes / 60;
}
