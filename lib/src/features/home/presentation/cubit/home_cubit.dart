import 'package:bloc/bloc.dart';
import 'package:doctor_app/src/features/auth/data/model/doctor_model.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeRepo homeRepo;

  HomeCubit(this.homeRepo):super(HomeInitiateState());

  static HomeCubit get(context)=>BlocProvider.of(context);

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
}