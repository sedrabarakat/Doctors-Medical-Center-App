part of 'patient_cubit.dart';

abstract class PatientState {}

class PatientInitialState extends PatientState {}

class GetPatientSessionsLoadingState extends PatientState {}

class GetPatientSessionsErrorState extends PatientState {
  final NetworkExceptions error;
  GetPatientSessionsErrorState(this.error);
}

class GetpatientSessionsSuccessState extends PatientState {
  List<SessionModel> closedSession;
  List<SessionModel> openedSession;
  GetpatientSessionsSuccessState(
      {required this.closedSession, required this.openedSession});
}

class GetSessionLoadingState extends PatientState {}

class GetSessionErrorState extends PatientState {
  final NetworkExceptions error;
  GetSessionErrorState(this.error);
}

class GetSessionSuccessState extends PatientState {
  final SessionModel session;
  GetSessionSuccessState(this.session);
}

class AddSessionDetailsLoadingState extends PatientState {}

class AddSessionDetailsSuccessState extends PatientState {}

class AddSessionDetailsErrorState extends PatientState {
  final NetworkExceptions error;
  AddSessionDetailsErrorState(this.error);
}

class NewTabState extends PatientState {}

class GetSessionDetailsInformationLoadingState extends PatientState {
  final int sessionDetailsId;
  GetSessionDetailsInformationLoadingState({required this.sessionDetailsId});
}

class GetSessionDetailsInformationSuccessState extends PatientState {
  final SessionDetailModel sessionDetails;
  final int sessionDetailsId;
  final DoctorModel doctor;

  GetSessionDetailsInformationSuccessState(
      {required this.sessionDetails,
      required this.sessionDetailsId,
      required this.doctor});
}

class GetSessionDetailsInformationErrorState extends PatientState {
  final NetworkExceptions error;
  final int sessionDetailsId;

  GetSessionDetailsInformationErrorState(
      {required this.error, required this.sessionDetailsId});
}

class UploadingFileLoadingState extends PatientState {}

class UploadingFileErrorState extends PatientState {
  final NetworkExceptions error;
  UploadingFileErrorState(this.error);
}

class UploadingFileSuccessState extends PatientState {}

class DownloadFileSuccessState extends PatientState {}

class PickFileSuccessState extends PatientState {}

class DiscardFileState extends PatientState {}
