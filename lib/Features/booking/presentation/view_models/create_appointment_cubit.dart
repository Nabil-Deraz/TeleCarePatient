import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
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

  CalendarFormat format = CalendarFormat.month;
  DateTime focusDay = DateTime.now();
  DateTime currentDay = DateTime.now();
  int? currentIndex;
  bool isWeekend = false;
  bool dateSelected = false;
  bool timeSelected = false;

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

  void changeCalendarSelection(int currentIndex, bool isSelected) {
    this.currentIndex = currentIndex;
    this.timeSelected = isSelected;
    emit(CreateAppointmentInitial());
  }

  void changeFormat(CalendarFormat format) {
    this.format = format;
    emit(CreateAppointmentInitial());
  }

  void changeCurrentFocusDate(
      DateTime currentDay, DateTime focusDay, bool dateSelected) {
    this.currentDay = currentDay;
    this.focusDay = focusDay;
    this.dateSelected = dateSelected;
    emit(CreateAppointmentInitial());
  }

  void weekends(DateTime selectedDay) {
    if (selectedDay.weekday == 5 || selectedDay.weekday == 6) {
      isWeekend = true;
      timeSelected = false;
      currentIndex = null;
    } else {
      isWeekend = false;
    }
    emit(CreateAppointmentInitial());
  }
}
