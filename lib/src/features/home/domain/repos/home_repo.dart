import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/data/models/doctor_model.dart';

abstract class HomeRepo{

  Future<Either<NetworkExceptions,DoctorModel>>getDoctorInfo();
}