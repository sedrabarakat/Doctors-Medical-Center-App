import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/data/models/patient_model.dart';

import '../../../../core/domain/error_handler/network_exceptions.dart';

abstract class PatientsRepo{


  Future<Either<NetworkExceptions,List<PatientModel>>> getMyPatient();
}