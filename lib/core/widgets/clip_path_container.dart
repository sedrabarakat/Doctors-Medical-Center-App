import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../../core/helper/color_helper.dart';

PreferredSizeWidget clipPathContainer({
  required BuildContext context,
  required String label,
  IconData? leadingIcon,
  void Function()? onLeadingPressed,
}) {
  return PreferredSize(
    preferredSize: Size(
      DimensionsHelper.widthPercentage(context, 100),
      kToolbarHeight + 50,
    ),
    child: ClipPath(
      clipper: WaveClipperOne(),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: ColorsHelper.primary,
          ),
          leadingIcon != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: onLeadingPressed,
                    icon: Icon(
                      leadingIcon,
                      color: Colors.white,
                      size: 22,
                    ),
                  ))
              : const SizedBox(),
          Align(
            alignment: Alignment.center,
            child: Text(
              label,
              style: StyleManager.fontBold22.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
