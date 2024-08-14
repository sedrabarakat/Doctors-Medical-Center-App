import 'package:bloc/bloc.dart';
part 'profile_doctor_state.dart';

class ProfileDoctorCubit extends Cubit<ProfileDoctorState> {
  ProfileDoctorCubit() : super(ProfileDoctorInitial());

  int indexTab = 1;
  void selectAboutTab() {
    emit(ProfileDoctorAboutTabSelected());
  }

  void selectAppointmentTab() {
    emit(ProfileDoctorAppointmentTabSelected());
  }

}
