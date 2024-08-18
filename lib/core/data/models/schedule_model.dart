import 'package:json_annotation/json_annotation.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel {
  @JsonKey(name: 'working_hours')
  final Map<String, List<String>> workingHours;

  ScheduleModel({required this.workingHours});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}
