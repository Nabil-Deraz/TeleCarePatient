import 'package:flutter/material.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.minimumSize,
      required this.backgroundColor,
      required this.foregroundColor,
      this.textColor = kWhitecomp});

  final void Function()? onPressed;
  final String text;
  final Size? minimumSize;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        minimumSize: minimumSize ??
            Size(MediaQuery.of(context).size.width * .9,
                MediaQuery.of(context).size.height * .09),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: Styles.Title18.copyWith(color: textColor),
      ),
    );
  }
}
