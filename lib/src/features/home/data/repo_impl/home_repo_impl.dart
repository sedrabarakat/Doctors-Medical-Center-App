import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/data/models/base_model.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/core/data/models/doctor_model.dart';
import 'package:doctor_app/src/features/home/data/data_sources/home_remote.dart';
import '../../../../../core/data/models/doctor_model.dart';
import '../../../../../core/data/models/patient_model.dart';
import '../../../appointments/data/models/appointment_model.dart';
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

  Future<Either<NetworkExceptions, List<AppointmentModel>>>
      getComingAppointment() async {
    List<AppointmentModel> list = [];
    try {
      BaseModel baseModel = await homeRemote.getComingAppointment();
      for (int i = 0; i < baseModel.data.length; i++) {
        list.add(AppointmentModel.fromJson(baseModel.data[i]));
      }
      return right(list);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, AppointmentModel>> getNextPatient() async {
    try {
      BaseModel baseModel = await homeRemote.getNextPatient();
      AppointmentModel appointmentModel =
          AppointmentModel.fromJson(baseModel.data);
      return right(appointmentModel);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<PatientModel>>> getMyPatient(
      {required String search}) async {
    List<PatientModel> list = [];
    try {
      BaseModel baseModel = await homeRemote.getMyPatient(search: search);

      for (int i = 0; i < baseModel.data.length; i++) {
        list.add(PatientModel.fromJson(baseModel.data[i]));
      }

      return right(list);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
