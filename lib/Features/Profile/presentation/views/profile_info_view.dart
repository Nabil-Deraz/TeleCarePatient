import 'package:flutter/material.dart';
import 'package:tecpatient/Features/Profile/presentation/views/widgets/profile_info_view_body.dart';
import 'package:tecpatient/constants.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhitecomp,
      body: SafeArea(
        child: ProfileInfoViewBody(),
      ),
    );
  }
}
