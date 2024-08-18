import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:doctor_app/core/data/models/base_model.dart';
import 'package:doctor_app/core/data/models/user_model.dart';
import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/core/domain/urls/app_url.dart';
import 'package:doctor_app/core/helper/dio_helper.dart';
import 'package:doctor_app/core/data/models/doctor_model.dart';
import 'package:doctor_app/src/features/auth/data/model/working_hour_model.dart';
import '../../../../../core/data/data_sources/local.dart';

class AuthRemoteDataSource {
  final ApiServices _apiServices;
  AuthRemoteDataSource(this._apiServices);
  Future<BaseModel> requestCode(String phoneNumber) async {
    final response = await _apiServices.post(
      AppUrl.requestCode,
      body: {
        'phone_number': phoneNumber,
      },
    );
    return BaseModel(data: null, message: response['message']);
  }

  Future<BaseModel<UserModel>> verifyCode(
      String phoneNumber, String code) async {
    final response = await _apiServices.post(AppUrl.verifyCode, body: {
      'phone_number': phoneNumber,
      'code': code,
    });
    await HiveService.Auth_Box!.put('Token', response['token']);
    DioHelper().addTokenInterceptor();

    return BaseModel.fromJson(response, (json) => UserModel.fromJson(json));
  }

  Future<BaseModel<DoctorModel>> signUp({
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
    String? description,
    Uint8List? image,
    required String sectionId,
    required String sessionDuration,
    required String daysInAadvance,
    required WorkingHourModel workingHour,
  }) async {
    final response = await _apiServices.post(AppUrl.signUp,
        formData: FormData.fromMap(
          {
            'first_name': firstName,
            "middle_name": middleName,
            "last_name": lastName,
            'phone_number': phoneNumber,
            'password': '00000000',
            'description': description,
            'image': image != null
                ? MultipartFile.fromBytes(image, filename: phoneNumber)
                : null,
            'section_id': sectionId,
            'session_durtion': sessionDuration,
            'days_in_advance': daysInAadvance,
            'working_hours': workingHour.toJson(),
          },
        ));
    return BaseModel.fromJson(response, (json) => DoctorModel.fromJson(json));
  }
}
