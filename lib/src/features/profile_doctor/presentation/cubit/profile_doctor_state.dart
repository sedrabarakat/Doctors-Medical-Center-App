part of 'profile_doctor_cubit.dart';

abstract class ProfileDoctorState {}

final class ProfileDoctorInitial extends ProfileDoctorState {}

final class ProfileDoctorAboutTabSelected extends ProfileDoctorState{}
final class ProfileDoctorAppointmentTabSelected extends ProfileDoctorState{}

final class GetDoctorProfileLoadingState extends ProfileDoctorState{}
final class GetDoctorProfileErrorState extends ProfileDoctorState{
  final NetworkExceptions error;
  GetDoctorProfileErrorState(this.error);
}
final class GetDoctorProfileSuccessState extends ProfileDoctorState{
  final DoctorProfileModel doctorProfile;

  GetDoctorProfileSuccessState(this.doctorProfile);

}

