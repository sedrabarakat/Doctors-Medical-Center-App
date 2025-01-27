import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class TextLabelTextButtonWidget extends StatelessWidget {
  const TextLabelTextButtonWidget({
    super.key,
    required this.label,
    required this.textButtonLabel,
    required this.onPressed,
  });
  final String label;
  final String textButtonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: StyleManager.fontRegular16,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButtonLabel,
            style: StyleManager.fontMedium16.copyWith(
              color: ColorsHelper.primary,
            ),
          ),
        )
      ],
    );
  }
}
