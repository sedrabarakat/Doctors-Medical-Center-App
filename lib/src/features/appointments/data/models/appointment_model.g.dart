// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      (json['id'] as num).toInt(),
      json['date'] as String,
      (json['doctor_id'] as num).toInt(),
      (json['patient_id'] as num).toInt(),
      json['start_min'] as String,
      PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctor_id,
      'patient_id': instance.patient_id,
      'date': instance.date,
      'start_min': instance.start_min,
      'patient': instance.patient,
    };
