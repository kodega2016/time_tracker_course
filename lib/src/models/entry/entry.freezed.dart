// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return _Entry.fromJson(json);
}

/// @nodoc
mixin _$Entry {
  String get id => throw _privateConstructorUsedError;
  String get jobId => throw _privateConstructorUsedError;
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryCopyWith<Entry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<$Res> {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) then) =
      _$EntryCopyWithImpl<$Res>;
  $Res call(
      {String id, String jobId, DateTime start, DateTime end, String? comment});
}

/// @nodoc
class _$EntryCopyWithImpl<$Res> implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  final Entry _value;
  // ignore: unused_field
  final $Res Function(Entry) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? jobId = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: jobId == freezed
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_EntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$$_EntryCopyWith(_$_Entry value, $Res Function(_$_Entry) then) =
      __$$_EntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String jobId, DateTime start, DateTime end, String? comment});
}

/// @nodoc
class __$$_EntryCopyWithImpl<$Res> extends _$EntryCopyWithImpl<$Res>
    implements _$$_EntryCopyWith<$Res> {
  __$$_EntryCopyWithImpl(_$_Entry _value, $Res Function(_$_Entry) _then)
      : super(_value, (v) => _then(v as _$_Entry));

  @override
  _$_Entry get _value => super._value as _$_Entry;

  @override
  $Res call({
    Object? id = freezed,
    Object? jobId = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$_Entry(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: jobId == freezed
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Entry extends _Entry {
  _$_Entry(
      {required this.id,
      required this.jobId,
      required this.start,
      required this.end,
      this.comment})
      : super._();

  factory _$_Entry.fromJson(Map<String, dynamic> json) =>
      _$$_EntryFromJson(json);

  @override
  final String id;
  @override
  final String jobId;
  @override
  final DateTime start;
  @override
  final DateTime end;
  @override
  final String? comment;

  @override
  String toString() {
    return 'Entry(id: $id, jobId: $jobId, start: $start, end: $end, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Entry &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.jobId, jobId) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end) &&
            const DeepCollectionEquality().equals(other.comment, comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(jobId),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end),
      const DeepCollectionEquality().hash(comment));

  @JsonKey(ignore: true)
  @override
  _$$_EntryCopyWith<_$_Entry> get copyWith =>
      __$$_EntryCopyWithImpl<_$_Entry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntryToJson(this);
  }
}

abstract class _Entry extends Entry {
  factory _Entry(
      {required final String id,
      required final String jobId,
      required final DateTime start,
      required final DateTime end,
      final String? comment}) = _$_Entry;
  _Entry._() : super._();

  factory _Entry.fromJson(Map<String, dynamic> json) = _$_Entry.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get jobId => throw _privateConstructorUsedError;
  @override
  DateTime get start => throw _privateConstructorUsedError;
  @override
  DateTime get end => throw _privateConstructorUsedError;
  @override
  String? get comment => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EntryCopyWith<_$_Entry> get copyWith =>
      throw _privateConstructorUsedError;
}
