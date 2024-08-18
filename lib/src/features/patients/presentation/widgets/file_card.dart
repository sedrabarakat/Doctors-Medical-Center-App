import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/helper/file_helper.dart';
import 'package:doctor_app/core/utils/assets_manager.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/patients/data/models/file_model.dart';
import 'package:doctor_app/src/features/patients/presentation/cubit/upload_download_cubit.dart';
import 'package:doctor_app/src/features/patients/presentation/cubit/upload_download_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FileCard extends StatelessWidget {
  const FileCard({
    super.key,
    required this.onDownloadPressed,
    required this.fileData,
  });
  final void Function()? onDownloadPressed;

  final FileModel fileData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AssetsManager.pdf,
            height: 50,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            width: AppSize.size10,
          ),
          Text(
            fileData.fileType,
            style: StyleManager.fontMedium16.copyWith(
              color: Colors.black,
            ),
          ),
          const Spacer(),
          BlocBuilder<UploadDownloadCubit, UploadDownloadState>(
            builder: (context, state) {
              if (state is DownloadingFileState &&
                  state.fileId == fileData.id) {
                return CircularProgressIndicator(
                  color: ColorsHelper.blue,
                  value: state.value,
                );
              } else {
                return TextButton(
                  onPressed: fileData.downloaded
                      ? () async {
                          FileHelper.openFile(
                              fileData.path, fileData.id, fileData.fileType);
                        }
                      : onDownloadPressed,
                  child: Text(
                    fileData.downloaded ? "Open" : "Download",
                    style: StyleManager.fontMedium13.copyWith(
                      color: ColorsHelper.blue,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
