import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    required this.label,
    this.hintText,
    this.onChnagedString,
    this.onChnagedint,
  });
  final Map<String, int> items;
  final String? hintText;
  final String label;
  final void Function(int)? onChnagedint;
  final void Function(String)? onChnagedString;
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: StyleManager.fontRegular12.copyWith(color: ColorsHelper.blue),
        ),
        DropdownButton<String>(
          isExpanded: true,
          hint: widget.hintText != null
              ? Text(
                  widget.hintText!,
                  style: StyleManager.fontMedium14
                      .copyWith(color: ColorsHelper.lighGrey),
                )
              : null,
          focusColor: ColorsHelper.blue,
          iconEnabledColor: ColorsHelper.blue,
          iconDisabledColor: ColorsHelper.lighGrey,
          value: selectedValue,
          style: StyleManager.fontMedium16.copyWith(
            color: ColorsHelper.black,
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
              if (widget.onChnagedint != null) {
                widget.onChnagedint!(widget.items[newValue]!);
              } else {
                widget.onChnagedString!(newValue!);
              }
            });
          },
          borderRadius: BorderRadius.circular(10),
          items:
              widget.items.keys.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
