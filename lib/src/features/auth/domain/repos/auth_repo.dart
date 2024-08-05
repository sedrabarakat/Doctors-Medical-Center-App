import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:doctor_app/src/features/auth/data/model/user_model.dart';
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
}
