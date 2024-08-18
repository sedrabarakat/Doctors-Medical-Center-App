import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.icon,
      this.buttonColor,
      this.textColor,
      this.elevation = 2.0,
      this.borderRadius = 40,
      this.padding = const EdgeInsets.all(16.0),
      this.minimumSizeH = 20,
      this.minimumSizeW = 100});

  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  final Color? buttonColor;
  final Color? textColor;
  final double elevation;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double minimumSizeH;
  final double minimumSizeW;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(minimumSizeW, minimumSizeH),
        backgroundColor: buttonColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: textColor ?? Colors.white),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(color: textColor ?? Colors.white),
                ),
              ],
            )
          : Text(
              label,
              style: TextStyle(color: textColor ?? Colors.white),
            ),
    );
  }
}
