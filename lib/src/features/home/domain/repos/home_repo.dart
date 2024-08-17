import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/src/features/appointments/data/models/appointment_model.dart';
import '../../../../../core/data/models/doctor_model.dart';
import '../../../../../core/data/models/patient_model.dart';

abstract class HomeRepo{

  Future<Either<NetworkExceptions,DoctorModel>>getDoctorInfo();

  Future<Either<NetworkExceptions, List<AppointmentModel>>>getComingAppointment();

  Future<Either<NetworkExceptions, AppointmentModel>>getNextPatient();

  Future<Either<NetworkExceptions,List<PatientModel>>> getMyPatient({
    required String search
  });
}