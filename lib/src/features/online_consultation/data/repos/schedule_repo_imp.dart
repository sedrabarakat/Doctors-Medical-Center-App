import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/data/models/base_model.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../domain/schedule_repo.dart';
import '../models/schedules_model.dart';
import '../models/specific_schedule.dart';
import '../remote/remote_schedule.dart';

class ScheduleRepoImpl extends ScheduleRepo {
  RemoteSchedule remoteSchedule;

  ScheduleRepoImpl(this.remoteSchedule);

  @override
  Future<Either<NetworkExceptions, String>> addSpecificSchedule(
      {required String date,
      required String fromTime,
      required String toTime}) async {
    try {
      BaseModel baseModel = await remoteSchedule.addSpecificSchedule(
          date: date, fromTime: fromTime, toTime: toTime);
      return right(baseModel.message);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> deleteSpecificSchedule(
      {required Schedule_id}) async{
    try{
      BaseModel baseModel = await remoteSchedule.deleteSpecificSchedule(Schedule_id: Schedule_id);
      return right(baseModel.message);
    }
        catch(error){
          return left(NetworkExceptions.getException(error));
        }
  }

  @override
  Future<Either<NetworkExceptions, List<SchedulesModel>>> getScheduleList(
      {required doctor_id}) async {
    try {
      List<SchedulesModel> list=[];
      BaseModel baseModel = await remoteSchedule.getScheduleList(doctor_id: doctor_id);
      for(int i=0;i<baseModel.data.length;i++){
        list.add(
            SchedulesModel.fromJson(baseModel.data[i])
        );
      }
      return right(list);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, SpecificScheduleModel>> getSpecificSchedule(
      {required Schedule_id}) async {
    try {
      BaseModel baseModel =
          await remoteSchedule.getSpecificSchedule(Schedule_id: Schedule_id);
      SpecificScheduleModel specificSchedule=SpecificScheduleModel.fromJson(baseModel.data);
      return right(specificSchedule);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseModel>> updateSpecificSchedule(
      {required Schedule_id,
      required String date,
      required String fromTime,
      required String toTime}) {
    // TODO: implement updateSpecificSchedule
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkExceptions, String>> sendCallEvent({required registeration_id})
  async{
    try{
      BaseModel baseModel=await remoteSchedule.sendCallEvent(registeration_id: registeration_id);
      return right("True");
    }
        catch(error){
          return left(NetworkExceptions.getException(error));
        }
  }
}
