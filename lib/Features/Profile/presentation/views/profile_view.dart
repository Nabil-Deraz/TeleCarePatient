import 'package:flutter/material.dart';
import 'package:tecpatient/Features/Profile/presentation/views/widgets/profile_view_body.dart';
import 'package:tecpatient/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhitecomp,
      body: SafeArea(
        child: ProfileViewBody(),
      ),
    );
  }
}
