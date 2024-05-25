import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/styles.dart';
import 'package:tecpatient/core/widgets/customButton.dart';

class GetStratedViewBody extends StatelessWidget {
  const GetStratedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(AssetsData.getStarted),
            const SizedBox(height: 20),
            Text(
              'Get Started',
              style: Styles.Title20.copyWith(
                  fontWeight: FontWeight.bold, color: const Color(0xff455A64)),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * .65,
              child: Text(
                'join now and enjoy all our services and boost your ',
                style: Styles.Title16.copyWith(color: const Color(0xff455A64)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Sign In",
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLoginView);
              },
              backgroundColor: kWhitecomp,
              foregroundColor: kPrimaryColor,
              textColor: kPrimaryColor,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Sign Up",
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSignupView);
              },
              backgroundColor: kPrimaryColor,
              foregroundColor: kWhitecomp,
            ),
            const SizedBox(height: 20),
            Text(
              "By logging in or registering you agree to our",
              style: Styles.Title16.copyWith(color: const Color(0xff455A64)),
            ),
            RichText(
              text: TextSpan(
                style: Styles.Title16,
                children: <TextSpan>[
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // launch('https://your-privacy-policy-url.com');
                      },
                    text: 'Terms of Service ',
                    style: Styles.Title13.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold), // Change color as needed
                  ),
                  TextSpan(
                    text: ' and ',
                    style: Styles.Title13.copyWith(
                        color: kDarkTitleColor, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // launch('https://your-privacy-policy-url.com');
                      },
                    text: ' Privacy Policy',
                    style: Styles.Title13.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold), // Change color as needed
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
