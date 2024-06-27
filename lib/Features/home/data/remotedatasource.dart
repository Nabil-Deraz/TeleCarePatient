import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:tecpatient/core/errors/ErrorModel.dart';
import 'package:tecpatient/core/models/PatientModel.dart';
import 'package:http/http.dart' as http;
import 'package:tecpatient/core/models/appointments_model.dart';
import 'package:tecpatient/core/utils/app_strings.dart';

class HomeRemoteDataSource {
  Future<PatientModel> getPatientsID(String id) async {
    PatientModel patientModel = PatientModel();

    try {
      final response =
          await http.get(Uri.parse(AppStrings.apiPatientsFilterID + id));
      if (response.statusCode == 200) {
        print("Success get Medical Records");
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          patientModel = PatientModel.fromJson(data);
          print("Medical Records: ${patientModel.data?[0]}");
        } else {
          print("Error in Success get Medical Records");
        }
        print(response.body);
      } else {
        print("Error in get Medical Records");
        final jsonResponse = jsonDecode(response.body);
        ErrorMessageModel.fromJson(jsonResponse);
        print('response error');
        print(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return patientModel;
  }

  Future<AppointmentsModel> getTodaysAppointments(regNum) async {
    AppointmentsModel appointments = AppointmentsModel();

    try {
      DateTime now = DateTime.now();
      String formattedDate =
          "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
      final response = await http.get(Uri.parse(
          AppStrings.apiAppointmentsFilter +
              regNum +
              AppStrings.apiAppointmentsFilterToday +
              formattedDate));
      print(regNum);
      print(formattedDate);
      if (response.statusCode == 200) {
        print("Success in getTodaysAppointments");
        final data = jsonDecode(response.body);
        print("data of data");
        print(data['data']);

        if (data is Map<String, dynamic>) {
          // Assuming ConsultantModel.fromJson method parses a single JSON object
          appointments = AppointmentsModel.fromJson(data);
          print(
              "Today's Appointments: ${appointments.data?.length ?? "no dataaa"}");
        } else {
          print("Error in Success getTodaysAppointments");
        }

        // print(response.body);
      } else {
        print("Error in getTodaysAppointments");
        final jsonResponse = jsonDecode(response.body);
        ErrorMessageModel.fromJson(jsonResponse);
        print(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return appointments;
  }
}
