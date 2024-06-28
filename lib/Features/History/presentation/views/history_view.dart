import 'package:flutter/material.dart';
import 'package:tecpatient/Features/History/presentation/views/widgets/history_view_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HistoryViewBody(),
      ),
    );
  }
}
