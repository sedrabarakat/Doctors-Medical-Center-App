// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      address: json['address'] as String,
      age: json['age'] as String,
      birthDate: json['birth_date'] as String,
      bloodPressure: json['blood_pressure'] as bool,
      bloodType: json['blood_type'] as String,
      diabetes: json['diabetes'] as bool,
      gender: json['gender'] as String,
      id: (json['id'] as num).toInt(),
      maritalStatus: json['marital_status'] as String,
      userData: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      userId: (json['user_id'] as num).toInt(),
      wallet: (json['wallet'] as num).toInt(),
      childrenNum: (json['children_num'] as num?)?.toInt(),
      habits: json['habits'] as String?,
      proffesion: json['proffesion'] as String?,
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'birth_date': instance.birthDate,
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'blood_type': instance.bloodType,
      'marital_status': instance.maritalStatus,
      'children_num': instance.childrenNum,
      'habits': instance.habits,
      'proffesion': instance.proffesion,
      'diabetes': instance.diabetes,
      'blood_pressure': instance.bloodPressure,
      'wallet': instance.wallet,
      'user': instance.userData,
    };
