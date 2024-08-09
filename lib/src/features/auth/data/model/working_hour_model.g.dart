// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingHourModel _$WorkingHourModelFromJson(Map<String, dynamic> json) =>
    WorkingHourModel(
      friday: (json['friday'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      monday: (json['monday'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      saturday: (json['saturday'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      sunday: (json['sunday'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      thursday: (json['thursday'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      tuesday: (json['tuesday'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      wednesday: (json['wednesday'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$WorkingHourModelToJson(WorkingHourModel instance) =>
    <String, dynamic>{
      'sunday': instance.sunday,
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
    };
