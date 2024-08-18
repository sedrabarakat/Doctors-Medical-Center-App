import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/assets_manager.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/core/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    super.key,
    required this.label,
    this.buttonPressed,
  });
  final String label;
  final void Function()? buttonPressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        // color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsManager.noData,
              width: DimensionsHelper.widthPercentage(context, 70),
              fit: BoxFit.fitWidth,
            ),
            buttonPressed == null
                ? Text(
                    label,
                    style: StyleManager.fontRegular18.copyWith(
                      color: Colors.black,
                    ),
                  )
                : CustomElevatedButton(
                    onPressed: buttonPressed!,
                    label: label,
                    buttonColor: ColorsHelper.blue,
                    minimumSizeW: DimensionsHelper.widthPercentage(context, 70),
                  ),
          ],
        ),
      ),
    );
  }
}
