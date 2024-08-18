// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorProfileModel _$DoctorProfileModelFromJson(Map<String, dynamic> json) =>
    DoctorProfileModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      sectionId: (json['section_id'] as num).toInt(),
      sessionDuration: (json['session_durtion'] as num).toInt(),
      daysInAdvance: (json['days_in_advance'] as num).toInt(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      section: SectionModel.fromJson(json['section'] as Map<String, dynamic>),
      schedule:
          ScheduleModel.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorProfileModelToJson(DoctorProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'section_id': instance.sectionId,
      'session_durtion': instance.sessionDuration,
      'days_in_advance': instance.daysInAdvance,
      'user': instance.user,
      'section': instance.section,
      'schedule': instance.schedule,
    };
