import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/data/models/base_model.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/core/data/models/doctor_model.dart';
import 'package:doctor_app/src/features/home/data/data_sources/home_remote.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRemote homeRemote;
  HomeRepoImpl(this.homeRemote);

  @override
  Future<Either<NetworkExceptions, DoctorModel>> getDoctorInfo() async {
    try {
      BaseModel baseModel = await homeRemote.getDoctorInfo();
      DoctorModel doctorModel = DoctorModel.fromJson(baseModel.data);
      return right(doctorModel);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
