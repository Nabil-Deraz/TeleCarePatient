import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/core/models/medical_records_model.dart';

class CustomResultsAppBarRow extends StatelessWidget {
  const CustomResultsAppBarRow({
    super.key,
    required this.medicalRecordsModel,
  });

  final Data medicalRecordsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
              size: 30,
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width * .18,
        ),
        Text(
          medicalRecordsModel.attributes!.patient!.data!.attributes!.name!,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    );
  }
}
