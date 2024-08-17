// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registeraitions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteraitionsModel _$RegisteraitionsModelFromJson(
        Map<String, dynamic> json) =>
    RegisteraitionsModel(
      json['updated_at'] as String,
      json['created_at'] as String,
      (json['id'] as num).toInt(),
      json['total_cost'] as String,
      (json['answered'] as num).toInt(),
      (json['doctor_id'] as num).toInt(),
      (json['online_guidance_schedule_id'] as num).toInt(),
      (json['patient_id'] as num).toInt(),
      (json['call_length'] as num?)?.toInt(),
      json['channel_name'] as String?,
      json['call_time'],
    );

Map<String, dynamic> _$RegisteraitionsModelToJson(
        RegisteraitionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'online_guidance_schedule_id': instance.online_guidance_schedule_id,
      'doctor_id': instance.doctor_id,
      'patient_id': instance.patient_id,
      'call_length': instance.call_length,
      'call_time': instance.call_time,
      'channel_name': instance.channel_name,
      'answered': instance.answered,
      'total_cost': instance.total_cost,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
