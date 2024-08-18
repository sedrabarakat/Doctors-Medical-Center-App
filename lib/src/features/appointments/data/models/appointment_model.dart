
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/data/models/patient_model.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel{
  int id;
  int doctor_id;
  int patient_id;
  String date;
  String start_min;
  PatientModel patient ;

  AppointmentModel(this.id,this.date,this.doctor_id,this.patient_id,this.start_min,
      this.patient);

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}