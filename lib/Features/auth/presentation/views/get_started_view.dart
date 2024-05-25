import 'package:flutter/material.dart';
import 'package:tecpatient/Features/auth/presentation/views/widgets/get_started_view_body.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GetStratedViewBody(),
      ),
    );
  }
}
