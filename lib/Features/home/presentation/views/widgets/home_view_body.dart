import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/patient_appointment_cubit.dart';
import 'package:tecpatient/Features/home/presentation/views/widgets/info_banner.dart';
import 'package:tecpatient/Features/home/presentation/views/widgets/patients_appointments.dart';
import 'package:tecpatient/Features/home/presentation/views/widgets/result_track.dart';
import 'package:tecpatient/core/local/cache_helper.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context
        .read<PatientAppointmentCubit>()
        .getTodaysAppointments(CacheHelper.getData(key: 'regNum'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoBanner(),
            SizedBox(
              height: 50,
            ),
            ResultTrack(),
            SizedBox(
              height: 25,
            ),
            PatientsAppointments(),
          ],
        ),
      ),
    );
  }
}
