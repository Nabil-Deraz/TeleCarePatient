import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tecpatient/Features/booking/data/remote_data_source.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/utils/functions/random_reg.dart';

part 'create_appointment_state.dart';

class CreateAppointmentCubit extends Cubit<CreateAppointmentState> {
  CreateAppointmentCubit() : super(CreateAppointmentInitial());

  BookingRemoteDataSource bookingRemoteDataSource = BookingRemoteDataSource();

  TextEditingController selectedDayController = TextEditingController();
  TextEditingController selectedTimeController = TextEditingController();
  TextEditingController specialitiyController = TextEditingController();
  void createAppointment(int hospitalid) async {
    emit(CreateAppointmentLoading());
    String id = '';
    bool uniqueID = await bookingRemoteDataSource.checkAppointmentId(id);
    do {
      id = generateRandomNumber().toString();
      print("id: $id");
      uniqueID = await bookingRemoteDataSource.checkAppointmentId(id);
      print("hola from appointment");
    } while (uniqueID);
    bool appointments = await bookingRemoteDataSource.postAppointment(
      patientId: CacheHelper.getData(key: 'patientId'),
      AppId: id,
      HospId: hospitalid,
      date: selectedDayController.text,
      time: selectedTimeController.text,
      Specialization: specialitiyController.text,
    );
    if (appointments) {
      emit(CreateAppointmentSuccess());
    } else {
      emit(CreateAppointmentFailure(
          "Problem in Making the Medical Record Please try again"));
    }
  }

  void clearControllers() {
    // _labsCheckboxesCubit.labInitial();
    // _labsCheckboxesCubit.labs.clear();
    // _labsCheckboxesCubit.selectedLabs.clear();
    emit(CreateAppointmentInitial());
  }
}
