import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'middle_name')
  final String middleName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'user_type')
  final String userType;
  final String? image;
  final String? description;
  @JsonKey(name: 'remember_token')
  final String? rememberToken;

  UserModel({
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.middleName,
    required this.phoneNumber,
    required this.rememberToken,
    required this.userType,
    this.image,
    this.description,
  });
  String get fullName => '$firstName $lastName';
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
