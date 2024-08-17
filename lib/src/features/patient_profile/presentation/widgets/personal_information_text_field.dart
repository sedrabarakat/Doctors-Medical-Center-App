import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:flutter/material.dart';

class PersonalInformationTextField extends StatefulWidget {
  const PersonalInformationTextField({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;
  @override
  State<PersonalInformationTextField> createState() =>
      _PersonalInformationTextFieldState();
}

class _PersonalInformationTextFieldState
    extends State<PersonalInformationTextField> {
  final FocusNode _focusNode = FocusNode();
  bool hasFocus = false;
  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsHelper.lighGrey,
          ),
        ),
        labelStyle: TextStyle(
          color:
              _focusNode.hasFocus ? ColorsHelper.primary : ColorsHelper.black,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsHelper.primary,
          ),
        ),
      ),
    );
  }
}
