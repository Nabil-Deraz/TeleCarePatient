import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecpatient/Features/History/presentation/manager/cubits/history_cubit/history_cubit.dart';
import 'package:tecpatient/Features/History/presentation/views/widgets/custom_patient_card_history.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

class HistoryViewBody extends StatefulWidget {
  const HistoryViewBody({super.key});

  @override
  State<HistoryViewBody> createState() => _HistoryViewBodyState();
}

class _HistoryViewBodyState extends State<HistoryViewBody> {
  @override
  void initState() {
    BlocProvider.of<HistoryCubit>(context).getMedicalRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Patients History',
            style: Styles.Title20.copyWith(
              color: kGreyDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomPatientCardHistory()
        ],
      ),
    );
  }
}
