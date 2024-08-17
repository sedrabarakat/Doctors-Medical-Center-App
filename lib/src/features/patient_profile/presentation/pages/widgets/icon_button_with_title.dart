import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class IconButtonWithTitle extends StatelessWidget {
  const IconButtonWithTitle({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final void Function()? onTap;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ColorsHelper.blue, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorsHelper.white,
            ),
            const SizedBox(
              width: AppSize.size10,
            ),
            Text(
              label,
              style: StyleManager.fontMedium16.copyWith(
                color: ColorsHelper.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
