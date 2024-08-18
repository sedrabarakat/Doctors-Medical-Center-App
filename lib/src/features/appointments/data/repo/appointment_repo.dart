import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/src/features/appointments/data/models/appointment_model.dart';
import 'package:doctor_app/src/features/appointments/data/remote/appointment_remote.dart';

import '../../../../../core/data/models/base_model.dart';

class AppointmentRepo {
  AppointmentRemote appointmentRemote;

  AppointmentRepo(this.appointmentRemote);

  Future<Either<NetworkExceptions, List<AppointmentModel>>>getComingAppointment()async{
    List<AppointmentModel> list=[];
    try{
      BaseModel baseModel = await appointmentRemote.getComingAppointment();
      for(int i=0;i<baseModel.data.length;i++){
        list.add(AppointmentModel.fromJson(baseModel.data[i]));
      }
      return right(list);
    }
    catch(error){
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions,List<AppointmentModel>>>getArchiveAppointment()async{
    try{
      List<AppointmentModel> list=[];
      BaseModel baseModel = await appointmentRemote.getArchiveAppointment();
      for(int i=0;i<baseModel.data.length;i++){
        list.add(AppointmentModel.fromJson(baseModel.data[i]));
      }
      return right(list);
    }
    catch(error){
      return left(NetworkExceptions.getException(error));
    }
  }


}