import 'package:dartz/dartz.dart';

import '../../../../core/data/models/base_model.dart';
import '../../../../core/domain/error_handler/network_exceptions.dart';
import '../data/remote/remote_doctor_profile.dart';

class DoctorProfileRepo{
  final RemoteDoctorProfile _remote;

  DoctorProfileRepo(this._remote);


  Future<Either<NetworkExceptions, BaseModel>> getDoctorProfile() async {
    try {
      final response = await _remote.getProfile(id: 1);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}