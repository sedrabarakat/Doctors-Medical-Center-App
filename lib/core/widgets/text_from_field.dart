import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../helper/color_helper.dart';

class TextField_def extends StatelessWidget {
  TextField_def(
      {super.key,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.iconData,
      this.hintText,
      this.obscureText = false,
      this.suffixIcon = false,
      this.validator,
      this.onChanged,
      this.onTap,
      this.onFieldSubmitted,
      this.autofocus = false,
      this.readOnly = false,
      this.filled = true,
      this.maxLine = 1,
      this.minLine = 1,
      this.textFieldHintColor = Colors.white,
      this.helperText,
      this.fillColor,
      this.suffixPressed,
      this.radius = 40,
      this.isNum = false,
      this.labelText,
      this.labelStyle,
      this.CursorColor = Colors.grey,
      this.textStyle,
        this.hintStyle,
      this.borderStyle = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        borderSide: BorderSide(
          color: Color(0XE0E0E0FF),
        ),
      )});

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? hintText;
  final String? helperText;
  final bool suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? suffixPressed;
  final VoidCallback? onTap;
  final int? maxLine;
  final int? minLine;

  final Color? textFieldHintColor;
  final double radius;
  bool isBorder = false;
  bool isNum = false;
  final InputBorder borderStyle;
  Color? fillColor;
  final bool filled;
  final Color CursorColor;
  final TextStyle? textStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      minLines: minLine,
      readOnly: readOnly,
      autofocus: autofocus,
      validator: validator ??
          (String? val) {
            if (val!.trim().isEmpty) return 'Filed is required*';
            return null;
          },
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      cursorColor: CursorColor,
      style: (textStyle != null) ? textStyle : null,
      inputFormatters: (isNum)
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
            ]
          : null,
      decoration: InputDecoration(
          helperMaxLines: 2,
          helperText: helperText,
          labelText: labelText,
          labelStyle: labelStyle,
          border: borderStyle,
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          filled: filled,
          fillColor:
              (fillColor != null) ? fillColor : ColorsHelper.primary.withOpacity(.15),
          hintStyle: (hintStyle!=null)?hintStyle:TextStyle(fontSize: 14, color: Colors.grey.shade800),
          prefixIcon: iconData == null
              ? null
              : Icon(
                  iconData,
                ),
          suffixIcon: suffixIcon
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    obscureText ? Icons.lock_open : Icons.lock_outline,
                    color: !obscureText
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ))
              : null,
          hintText: hintText),
    );
  }
}
