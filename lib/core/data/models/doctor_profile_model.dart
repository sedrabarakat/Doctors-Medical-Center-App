import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';
import 'section_model.dart';
import 'schedule_model.dart';

part 'doctor_profile_model.g.dart';

@JsonSerializable()
class DoctorProfileModel {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'section_id')
  final int sectionId;
  @JsonKey(name: 'session_durtion')
  final int sessionDuration;
  @JsonKey(name: 'days_in_advance')
  final int daysInAdvance;
  final UserModel user;
  final SectionModel section;
  final ScheduleModel schedule;

  DoctorProfileModel({
    required this.id,
    required this.userId,
    required this.sectionId,
    required this.sessionDuration,
    required this.daysInAdvance,
    required this.user,
    required this.section,
    required this.schedule,
  });

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorProfileModelToJson(this);
}
