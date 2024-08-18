import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/data/models/doctor_profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../domain/doctor_profile_repo.dart';
part 'profile_doctor_state.dart';

class ProfileDoctorCubit extends Cubit<ProfileDoctorState> {
  final DoctorProfileRepo _repo ;

  ProfileDoctorCubit(this._repo):super(ProfileDoctorInitial());

  static ProfileDoctorCubit get(context)=>BlocProvider.of(context);

  int indexTab = 1;
  void selectAboutTab() {
    emit(ProfileDoctorAboutTabSelected());
  }

  void selectAppointmentTab() {
    emit(ProfileDoctorAppointmentTabSelected());
  }

  late DoctorProfileModel myDoctor ;
  Future<void> getDoctorProfile()async{
    emit(GetDoctorProfileLoadingState()) ;
    await _repo.getDoctorProfile().then((value){
      value.fold((error){
        emit(GetDoctorProfileErrorState(error));
      }, (data){
        myDoctor = data.data ;
        emit(GetDoctorProfileSuccessState(data.data)) ;
      }) ;
    }) ;
  }

}
