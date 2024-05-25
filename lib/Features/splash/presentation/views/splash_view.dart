import 'package:flutter/material.dart';
import 'package:tecpatient/Features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:tecpatient/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kPrimaryColor, body: SplashViewBody());
  }
}
