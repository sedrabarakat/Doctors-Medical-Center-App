import 'package:doctor_app/src/features/online_consultation/data/models/registeraitions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specific_schedule.g.dart';

@JsonSerializable()
class SpecificScheduleModel {
  int id;
  String date;
  String from_min;
  String to_min;
  String created_at;
  String updated_at;

  List<RegisteraitionsModel> registerations;

  SpecificScheduleModel(this.id, this.date, this.created_at, this.from_min,
      this.to_min, this.updated_at, this.registerations);

  factory SpecificScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$SpecificScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificScheduleModelToJson(this);
}
