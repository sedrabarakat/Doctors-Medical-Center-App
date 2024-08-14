import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/data/models/base_model.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/src/features/online_consultation/data/models/schedules_model.dart';
import 'package:doctor_app/src/features/online_consultation/data/models/specific_schedule.dart';

abstract class ScheduleRepo{

  Future<Either<NetworkExceptions,List<SchedulesModel>>> getScheduleList({
    required doctor_id
});
  Future<Either<NetworkExceptions,SpecificScheduleModel>>  getSpecificSchedule({
    required Schedule_id
});
  Future<Either<NetworkExceptions,String>>  addSpecificSchedule({
    required String date,
    required String fromTime,
    required String toTime
  });
  Future<Either<NetworkExceptions,String>>  deleteSpecificSchedule(
      {
        required Schedule_id
      }
      );
  Future<Either<NetworkExceptions,BaseModel>>  updateSpecificSchedule({
    required Schedule_id,
    required String date,
    required String fromTime,
    required String toTime
  });

  Future<Either<NetworkExceptions,String>>sendCallEvent({
    required registeration_id
});
}