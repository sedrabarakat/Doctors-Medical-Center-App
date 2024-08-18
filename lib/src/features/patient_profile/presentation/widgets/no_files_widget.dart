import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/assets_manager.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoFilesWidget extends StatelessWidget {
  const NoFilesWidget({
    super.key,
    required this.onAddFilePressed,
  });
  final void Function()? onAddFilePressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SvgPicture.asset(
              AssetsManager.addFile,
              width: 150,
              color: Colors.black54,
            ),
            const SizedBox(
              height: AppSize.size20,
            ),
            Text(
              'Add files to this session',
              style: StyleManager.fontMedium16.copyWith(
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: AppSize.size10,
            ),
            SizedBox(
              width: DimensionsHelper.widthPercentage(
                context,
                50,
              ),
              child: ElevatedButton(
                onPressed: onAddFilePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsHelper.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add File',
                  style: StyleManager.fontMedium16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
