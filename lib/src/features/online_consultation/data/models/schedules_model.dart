import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedules_model.g.dart';

@JsonSerializable()
class SchedulesModel{
 int id;
 int doctor_id;
 String  date;
 String from_min;
 String to_min;
 String created_at;
 String updated_at;
 //todo doctor model when its end

 SchedulesModel(this.id, this.doctor_id, this.date, this.from_min, this.to_min,
      this.created_at, this.updated_at);

 factory SchedulesModel.fromJson(Map<String,dynamic>json)=>_$SchedulesModelFromJson(json);

 Map<String, dynamic> toJson() => _$SchedulesModelToJson(this);
}
