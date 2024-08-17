// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificScheduleModel _$SpecificScheduleModelFromJson(
        Map<String, dynamic> json) =>
    SpecificScheduleModel(
      (json['id'] as num).toInt(),
      json['date'] as String,
      json['created_at'] as String,
      json['from_min'] as String,
      json['to_min'] as String,
      json['updated_at'] as String,
      (json['registerations'] as List<dynamic>)
          .map((e) => RegisteraitionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecificScheduleModelToJson(
        SpecificScheduleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'from_min': instance.from_min,
      'to_min': instance.to_min,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'registerations': instance.registerations,
    };
