import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLine;
  final bool readOnly;
  final double? height;
  final String? hintText;
  final String labelText;
  final IconData? icon;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.hintText,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.maxLine = 1,
    this.height,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsHelper.primary,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      minLines: 1,
      maxLines: widget.maxLine,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 12),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        constraints: widget.height != null
            ? BoxConstraints(maxHeight: widget.height!)
            : null,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        labelText: widget.labelText,
        labelStyle:
            StyleManager.fontRegular14.copyWith(color: ColorsHelper.black),
        floatingLabelStyle:
            StyleManager.fontRegular14.copyWith(color: ColorsHelper.primary),
        suffixIcon: Icon(
          widget.icon,
          color: _focusNode.hasFocus
              ? ColorsHelper.primary
              : ColorsHelper.lighGrey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorsHelper.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
