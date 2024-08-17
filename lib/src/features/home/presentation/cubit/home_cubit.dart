import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/data/models/patient_model.dart';
import 'package:doctor_app/src/features/appointments/data/models/appointment_model.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/models/doctor_model.dart';
import '../../domain/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeRepo homeRepo;

  HomeCubit(this.homeRepo):super(HomeInitiateState());

  static HomeCubit get(context)=>BlocProvider.of(context);

  bool isHome=true;
  TextEditingController search=TextEditingController();

  void SetHome(){
    isHome=true;
    emit(Toggle_IsList());
  }
  void SetList(){
    isHome=false;
    emit(Toggle_IsList());
  }

  static DoctorModel ?doctorModel;
  Future<void>getDoctorInfo()async{
    emit(Loading_GetDoctorInfo_State());
    await homeRepo.getDoctorInfo().then((value){
      value.fold((error){
        print(error);
        emit(Error_GetDoctorInfo_State());
      }, (DoctorModel){
        doctorModel=DoctorModel;
        emit(Success_GetDoctorInfo_State());
      });
    });
  }

  List<AppointmentModel>list=[];
  Future<void>getComingAppointment()async{
   emit(Loading_GetComingAppointment_State());
   await homeRepo.getComingAppointment().then((value){
     value.fold((error){
       emit(Error_GetComingAppointment_State());
     },
             (value){
               list=value;
       emit(Success_GetComingAppointment_State());
             }
     );
   });
  }

  AppointmentModel ?nextPatient;
  Future<void>getNextPatient()async{
    emit(Loading_GetNextPatient_State());
    await homeRepo.getNextPatient().then((value){
      value.fold((error){
        emit(Error_GetNextPatientt_State());
      }, (value){
        nextPatient=value;
        emit(Success_GetNextPatient_State());
      });
    });
  }
  List<PatientModel>myPatients=[];
  Future<void>getPatient({
    required String search
  })async{
    await homeRepo.getMyPatient(search: search).then((value){
      value.fold((error){
        emit(Error_GetPatientsList_State());
      }, (list){
        myPatients=list;
        emit(Success_GetPatientsList_State());
      });

    });
  }
}