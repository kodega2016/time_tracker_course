// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Job _$$_JobFromJson(Map<String, dynamic> json) => _$_Job(
      id: json['id'] as String,
      title: json['title'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$_JobToJson(_$_Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'rate': instance.rate,
    };
