// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      daysInAdvance: json['days_in_advance'] as String,
      id: (json['id'] as num).toInt(),
      section: SectionModel.fromJson(json['section'] as Map<String, dynamic>),
      sectionId: json['section_id'] as String,
      sessionDuration: json['session_duration'] as String,
      userData: UserModel.fromJson(json['userData'] as Map<String, dynamic>),
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'section_id': instance.sectionId,
      'session_duration': instance.sessionDuration,
      'days_in_advance': instance.daysInAdvance,
      'user_id': instance.userId,
      'id': instance.id,
      'userData': instance.userData,
      'section': instance.section,
    };
