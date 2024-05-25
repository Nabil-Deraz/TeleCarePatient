import 'package:flutter/material.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.labelText = "",
    this.hintText = "",
    this.controller,
    this.isPassword = false,
    this.suffixIcon,
    this.maxLength,
    this.keyboardType = TextInputType.name,
  });
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  bool isPassword;
  final Widget? suffixIcon;
  final int? maxLength;
  final TextInputType keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: kBlack),
      cursorColor: kPrimaryColor,
      controller: widget.controller,
      obscureText: _obscureText,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        filled: true,
        fillColor: kGreyLight.withOpacity(0.2),
        labelStyle: Styles.Title13.copyWith(color: kBlack),
        hintStyle: Styles.Title13.copyWith(color: kGreyDark),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kGreyLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kGreyLight, width: 0)),
      ),
    );
  }
}
