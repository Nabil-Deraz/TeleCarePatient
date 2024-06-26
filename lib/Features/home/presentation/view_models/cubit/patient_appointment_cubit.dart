import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tecpatient/Features/home/data/remotedatasource.dart';
import 'package:tecpatient/core/models/appointments_model.dart';

part 'patient_appointment_state.dart';

class PatientAppointmentCubit extends Cubit<PatientAppointmentState> {
  PatientAppointmentCubit() : super(PatientAppointmentInitial());
  HomeRemoteDataSource remoteDataSource = HomeRemoteDataSource();
  ScrollController scrollController = ScrollController();
  void getTodaysAppointments(String regNum) async {
    emit(PatientAppointmentLoading());
    print("before await");
    final patientAppointment =
        await remoteDataSource.getTodaysAppointments(regNum);
    print("after await");

    if (patientAppointment.data!.isNotEmpty) {
      print("before emit");
      emit(PatientAppointmentSuccess(appointmentsModel: patientAppointment));
      print("after emit");
    } else {
      emit(PatientAppointmentFailure(errorMessage: 'No Patient data'));
    }
  }
}
