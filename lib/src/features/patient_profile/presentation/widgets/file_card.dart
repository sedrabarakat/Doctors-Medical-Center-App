import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/assets_manager.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FileCard extends StatelessWidget {
  const FileCard({super.key});

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
            "File name",
            style: StyleManager.fontMedium16.copyWith(
              color: Colors.black,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              "Download",
              style: StyleManager.fontMedium13.copyWith(
                color: ColorsHelper.turquoise,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
