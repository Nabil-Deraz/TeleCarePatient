import 'package:flutter/material.dart';
import 'package:tecpatient/Features/History/presentation/views/widgets/results_view_body.dart';
import 'package:tecpatient/core/models/medical_records_model.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({super.key, required this.medicalRecordsModel});

  final Data medicalRecordsModel;

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResultsViewBody(
          medicalRecordsModel: widget.medicalRecordsModel,
        ),
      ),
    );
  }
}
