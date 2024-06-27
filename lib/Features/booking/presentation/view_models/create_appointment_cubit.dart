import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tecpatient/Features/booking/data/remote_data_source.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/utils/functions/random_reg.dart';

part 'create_appointment_state.dart';

class CreateAppointmentCubit extends Cubit<CreateAppointmentState> {
  CreateAppointmentCubit() : super(CreateAppointmentInitial());

  BookingRemoteDataSource bookingRemoteDataSource = BookingRemoteDataSource();

  TextEditingController specialitiyController = TextEditingController();

  CalendarFormat format = CalendarFormat.month;
  DateTime focusDay = DateTime.now();
  DateTime currentDay = DateTime.now();
  int? currentIndex;
  bool isWeekend = false;
  bool dateSelected = false;
  bool timeSelected = false;

  String formattedTime = "";
  DateTime time = DateTime.now();

  String spec = '';

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
    print("iddddddddddddddddddd $id");
    bool appointments = await bookingRemoteDataSource.postAppointment(
      patientId: CacheHelper.getData(key: 'Pid'),
      appId: id,
      hospId: hospitalid,
      date: DateFormat("yyyy-MM-dd").format(focusDay),
      time: formattedTime,
      specialization: spec,
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
    time = DateTime(0, 0, 0, currentIndex + 9);
    formattedTime = DateFormat('HH:mm:ss').format(time);
    // print(
    // "Time Selected ${DateFormat("hh:mm:ss").format(DateTime.parse((currentIndex + 9).toString()))}");
    print("Time Selected $formattedTime");
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
    // print("Current Day ${currentDay}");
    print("focus Day ${DateFormat("yyyy-MM-dd").format(focusDay)}");
    // print("focus Day ${focusDay.year}-${focusDay.month}-${focusDay.day}");

    emit(CreateAppointmentInitial());
  }

  void weekends(DateTime selectedDay) {
    if (selectedDay.weekday == 5 || selectedDay.weekday == 6) {
      isWeekend = true;
      timeSelected = false;
      currentIndex = null;
      emit(AppointmentWeekend(isWeekend));
    } else {
      isWeekend = false;
      emit(AppointmentWeekend(isWeekend));
    }
  }

  void dropDownMenuValue(String value) {
    spec = value;
    print(spec);
  }

  void checkForAvailability(int hospitalid) {
    if (!(focusDay.isBlank == true || focusDay.isNull == true) &&
        formattedTime != '' &&
        spec != '') {
      createAppointment(hospitalid);
    } else {
      emit(CreateAppointmentFailure("Please check that all isn't blank"));
    }
  }

  void initialState() {
    format = CalendarFormat.month;
    focusDay = DateTime.now();
    currentDay = DateTime.now();
    currentIndex = null;
    isWeekend = false;
    dateSelected = false;
    timeSelected = false;

    formattedTime = "";
    time = DateTime.now();

    spec = '';
  }
}
