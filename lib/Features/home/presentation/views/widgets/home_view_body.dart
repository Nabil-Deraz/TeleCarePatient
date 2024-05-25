import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tecpatient/Features/home/presentation/views/widgets/info_banner.dart';
import 'package:tecpatient/Features/home/presentation/views/widgets/patients_appointments.dart';
import 'package:tecpatient/Features/home/presentation/views/widgets/result_track.dart';




class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         InfoBanner(),
         SizedBox(height: 50,),
         ResultTrack(),
         SizedBox(height: 25,),
         PatientsAppointments(),
        
        
        
      ],
    );
  }
}

