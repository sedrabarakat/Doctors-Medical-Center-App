abstract class UploadDownloadState {}

class UploadDownloadInitialState extends UploadDownloadState {}

class UploadingFileState extends UploadDownloadState {
  final double value;
  UploadingFileState(this.value);
}

class DownloadingFileState extends UploadDownloadState {
  final int fileId;
  final double value;
  DownloadingFileState(this.value, this.fileId);
}

class DownloadedState extends UploadDownloadState {
  final int fileId;
  DownloadedState(this.fileId);
}
