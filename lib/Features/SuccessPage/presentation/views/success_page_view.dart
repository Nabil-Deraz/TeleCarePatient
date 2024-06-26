import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/styles.dart';
import 'package:tecpatient/core/widgets/customButton.dart';

class BookingSuccessfulPage extends StatelessWidget {
  const BookingSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 3, child: Lottie.asset(AssetsData.successLottie)),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Successfuly Booked',
              style: Styles.Title20.copyWith(
                  fontWeight: FontWeight.w600, color: kGreen),
            ),
          ),
          Spacer(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: CustomButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  GoRouter.of(context).go(AppRouter.kHomeView);
                },
                text: 'Go to Home Page',
                foregroundColor: kGreen,
              )),
        ],
      )),
    );
  }
}
