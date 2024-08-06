import 'package:doctor_app/src/features/auth/data/model/section_model.dart';
import 'package:doctor_app/src/features/auth/data/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  @JsonKey(name: 'section_id')
  final String sectionId;
  @JsonKey(name: 'session_durtion')
  final String sessionDuration;
  @JsonKey(name: 'days_in_advance')
  final String daysInAdvance;
  @JsonKey(name: 'user_id')
  final int userId;
  final int id;
  @JsonKey(name: 'user')
  final UserModel userData;
  final SectionModel section;
  DoctorModel(
      {required this.daysInAdvance,
      required this.id,
      required this.section,
      required this.sectionId,
      required this.sessionDuration,
      required this.userData,
      required this.userId});
  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}
