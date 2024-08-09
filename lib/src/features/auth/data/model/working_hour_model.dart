import 'package:freezed_annotation/freezed_annotation.dart';

part 'working_hour_model.g.dart';

@JsonSerializable()
class WorkingHourModel {
  @JsonKey(defaultValue: <String>[])
  List<String> sunday;
  @JsonKey(defaultValue: <String>[])
  List<String> monday;

  @JsonKey(defaultValue: <String>[])
  List<String> tuesday;

  @JsonKey(defaultValue: <String>[])
  List<String> wednesday;

  @JsonKey(defaultValue: <String>[])
  List<String> thursday;

  @JsonKey(defaultValue: <String>[])
  List<String> friday;

  @JsonKey(defaultValue: <String>[])
  List<String> saturday;
  WorkingHourModel({
    required this.friday,
    required this.monday,
    required this.saturday,
    required this.sunday,
    required this.thursday,
    required this.tuesday,
    required this.wednesday,
  });
  factory WorkingHourModel.fromJson(Map<String, dynamic> json) =>
      _$WorkingHourModelFromJson(json);
  Map<String, dynamic> toJson() => _$WorkingHourModelToJson(this);
}
