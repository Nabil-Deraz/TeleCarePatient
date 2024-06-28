import 'package:flutter/material.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

Widget stateColorWidgetCheck(String state) {
  if (state == '1') {
    return Text(
      "In Lab",
      style: Styles.Title11.copyWith(
          color: kRed, fontWeight: FontWeight.bold, fontSize: 12),
    );
  } else if (state == '2') {
    return Text(
      "In Review",
      style: Styles.Title11.copyWith(
          color: kOrange, fontWeight: FontWeight.bold, fontSize: 12),
    );
  } else if (state == '3') {
    return Text(
      "Ready",
      style: Styles.Title11.copyWith(
          color: kGreeen, fontWeight: FontWeight.bold, fontSize: 12),
    );
  } else {
    return Text(
      "Viewed",
      style: Styles.Title11.copyWith(
          color: kGreyDark, fontWeight: FontWeight.bold, fontSize: 12),
    );
  }
}
