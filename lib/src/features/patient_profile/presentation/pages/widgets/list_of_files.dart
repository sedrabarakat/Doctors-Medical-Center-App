import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/file_card.dart';
import 'package:flutter/material.dart';

class ListOfFiles extends StatelessWidget {
  const ListOfFiles(
      {super.key, required this.files, required this.onUploadFilePressed});
  final List<dynamic> files;
  final void Function()? onUploadFilePressed;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppSize.screenPadding),
      itemBuilder: (context, index) {
        if (index == files.length) {
          return TextButton(
            onPressed: onUploadFilePressed,
            child: Text(
              'Upload File',
              style: StyleManager.fontMedium16.copyWith(
                color: ColorsHelper.turquoise,
              ),
            ),
          );
        } else {
          return const FileCard();
        }
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.size10,
      ),
      itemCount: files.length + 1,
    );
  }
}
