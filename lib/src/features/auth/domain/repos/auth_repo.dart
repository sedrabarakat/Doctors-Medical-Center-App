import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/data/models/user_model.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:doctor_app/core/data/models/doctor_model.dart';
import 'package:doctor_app/src/features/auth/data/model/working_hour_model.dart';
import '../../../../../core/data/models/base_model.dart';

class AuthRepo {
  final AuthRemoteDataSource _remote;
  AuthRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModel>> requestCode(
      String phoneNumber) async {
    try {
      final response = await _remote.requestCode(phoneNumber);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<UserModel>>> verifyCode(
      String phoneNumber, String code) async {
    try {
      final response = await _remote.verifyCode(phoneNumber, code);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<DoctorModel>>> signUp({
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
    try {
      final response = await _remote.signUp(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        sectionId: sectionId,
        sessionDuration: sessionDuration,
        daysInAadvance: daysInAadvance,
        image: image,
        description: description,
        workingHour: workingHour,
      );
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
