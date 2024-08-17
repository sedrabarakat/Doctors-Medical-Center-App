import 'package:bloc/bloc.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/cubit/upload_download_state.dart';

class UploadDownloadCubit extends Cubit<UploadDownloadState> {
  UploadDownloadCubit() : super(UploadDownloadInitialState());
  void uploadingFileProgress(double progress) {
    emit(UploadingFileState(progress));
  }

  void downloadingFileProgress(double progress, int fileId) {
    if (progress < 1) {
      emit(
        DownloadingFileState(progress, fileId),
      );
    } else {
      emit(DownloadedState(fileId));
    }
  }
}
