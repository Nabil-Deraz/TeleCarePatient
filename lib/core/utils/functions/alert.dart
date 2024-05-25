import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

void showAlert(
    {required String title,
    required String message,
    Widget? image,
    Color? color = kPrimaryColor,
    String? buttontext,
    required BuildContext context}) async {
  await Alert(
    context: context,
    title: title,
    desc: message,
    image: image,
    buttons: [
      DialogButton(
          color: color,
          child: Text(
            buttontext ?? "Close",
            style: Styles.Title13.copyWith(color: kBackgroundColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
    alertAnimation: (context, animation, secondaryAnimation, child) {
      final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * -200, 0.0),
        child: Opacity(
          opacity: animation.value,
          child: child,
        ),
      );
    },
  ).show();
}
