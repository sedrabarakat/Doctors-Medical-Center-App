import 'package:bloc/bloc.dart';
import 'package:doctor_app/src/features/appointments/data/models/appointment_model.dart';
import 'package:doctor_app/src/features/appointments/presentation/cubits/appointment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/appointment_repo.dart';

class AppointmentCubit extends Cubit<AppointmentStates>{

  AppointmentRepo appointmentRepo;

  AppointmentCubit(this.appointmentRepo):super(Init_States());

  static AppointmentCubit get(context)=>BlocProvider.of(context);


  List<AppointmentModel> comingAppointment=[];
  Future<void>getComingAppointment()async{
    emit(Loading_GetComingAppointment_State());
    await appointmentRepo.getComingAppointment().then((value){
      value.fold((error){
        emit(Error_GetComingAppointment_State());
      },
              (value){
                comingAppointment=value;
            emit(Success_GetComingAppointment_State());
          }
      );
    });
  }


  List<AppointmentModel> archiveAppointment=[];
  Future<void>getArchiveAppointment()async{
    emit(Loading_GetArchiveAppointment_State());
    await appointmentRepo.getArchiveAppointment().then((value){
      value.fold((error){
        emit(Error_GetArchiveAppointment_State());
      },
              (value){
                archiveAppointment=value;
            emit(Success_GetArchiveAppointment_State());
          }
      );
    });
  }

}