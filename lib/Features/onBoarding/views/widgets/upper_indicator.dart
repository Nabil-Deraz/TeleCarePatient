import 'package:flutter/material.dart';
import 'package:tecpatient/Features/onBoarding/static/static.dart';
import 'package:tecpatient/constants.dart';

class UpperIndicatorBoarding extends StatelessWidget {
  final int num;
  const UpperIndicatorBoarding({
    super.key,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          onBoardingList.length,
          (index) => Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: index == num ? kPrimaryColor : kGreyDark,
                  width: MediaQuery.of(context).size.width * .3,
                  height: MediaQuery.of(context).size.height * .009,
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
