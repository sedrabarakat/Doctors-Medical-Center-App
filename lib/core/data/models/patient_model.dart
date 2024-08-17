import 'package:doctor_app/core/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  @JsonKey(name: 'birth_date')
  final String birthDate;
  final String age;
  final String gender;
  final String address;
  @JsonKey(name: 'blood_type')
  final String bloodType;
  @JsonKey(name: 'marital_status')
  final String maritalStatus;
  final String? habits;
  final String proffesion;
  final bool diabetes;
  @JsonKey(name: 'blood_pressure')
  final bool bloodPressure;
  final int wallet;
  @JsonKey(name: 'user_id')
  final int userId;
  final int id;
  final int children_num;
  @JsonKey(name: 'user')
  final UserModel personalInformation;

  PatientModel({
    required this.address,
    required this.age,
    required this.birthDate,
    required this.bloodPressure,
    required this.bloodType,
    required this.diabetes,
    required this.gender,
    required this.id,
    required this.maritalStatus,
    required this.personalInformation,
    required this.proffesion,
    required this.userId,
    required this.wallet,
    this.habits,
    required this.children_num
  });
  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}

