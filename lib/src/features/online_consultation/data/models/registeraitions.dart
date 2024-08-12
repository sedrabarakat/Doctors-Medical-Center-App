import 'package:freezed_annotation/freezed_annotation.dart';

part 'registeraitions.g.dart';

@JsonSerializable()
class RegisteraitionsModel{

  int id;

  int online_guidance_schedule_id;
  int doctor_id;
  int patient_id;

  int? call_length;
  var call_time;
  String? channel_name;

  int answered;
  String total_cost;
  String created_at;
  String updated_at;

  RegisteraitionsModel(
      this.updated_at,this.created_at,this.id,
      this.total_cost,
      this.answered  ,this.doctor_id,
      this.online_guidance_schedule_id,this.patient_id,
      this.call_length,this.channel_name,this.call_time
      );

  factory RegisteraitionsModel.fromJson(Map<String, dynamic> json) => _$RegisteraitionsModelFromJson(json);


  Map<String, dynamic> toJson() => _$RegisteraitionsModelToJson(this);

}
