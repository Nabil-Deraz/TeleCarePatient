import 'package:flutter/material.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

class CustomEditableFormField extends StatelessWidget {
  const CustomEditableFormField(
      {super.key,
      required this.controller,
      required this.readOnly,
      required this.prefixIcon,
      required this.onTap,
      required this.isEditable,
      this.keyboardType,
      this.maxLength,
      this.hintText});

  final controller;
  final readOnly;
  final prefixIcon;
  final void Function()? onTap;
  final isEditable;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLength: maxLength,
        keyboardType: keyboardType,
        controller: controller,
        readOnly: readOnly,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffix: isEditable
              ? GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              : null,
          fillColor: kGreyLight.withOpacity(0.2),
          hintStyle: Styles.Title14.copyWith(color: kGreyDark),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kPrimaryColor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kPrimaryColor, width: 0.5)),
        ),
      ),
    );
  }
}
