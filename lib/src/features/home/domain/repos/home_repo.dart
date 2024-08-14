import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/src/features/auth/data/model/doctor_model.dart';

abstract class HomeRepo{

  Future<Either<NetworkExceptions,DoctorModel>>getDoctorInfo();
}