import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/data/models/patient_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/PatientsRepo.dart';
import 'list_states.dart';


class PatientListCubit extends Cubit<Patients_ListStates>{

  PatientsRepo patientsRepo;

  PatientListCubit(this.patientsRepo):super(Init_State());

  static PatientListCubit get(context)=>BlocProvider.of(context);


  List<PatientModel>myPatients=[];
  Future<void>getMyPatient()async{
    await patientsRepo.getMyPatient().then((value){
      value.fold((error){
        emit(Error_GetPatientsList_State());
      }, (list){
        myPatients=list;
        emit(Success_GetPatientsList_State());
      });

    });
  }







}