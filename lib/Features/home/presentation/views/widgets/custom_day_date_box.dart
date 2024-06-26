import 'package:flutter/material.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/functions/day_to_day_convert.dart';
import 'package:tecpatient/core/utils/functions/number_to_name_weekday_convert.dart';
import 'package:tecpatient/core/utils/styles.dart';

class DateDayBoxWidget extends StatelessWidget {
  const DateDayBoxWidget({
    super.key,
    required this.date,
  });
  final String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          numberToWeekdayConverter(date),
          style: Styles.Title18.copyWith(
              color: kWhitecomp, fontWeight: FontWeight.bold),
        ),
        Text(
          dateToDayConverter(date),
          style: Styles.Title18.copyWith(
              color: kWhitecomp, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
