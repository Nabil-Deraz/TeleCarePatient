import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tecpatient/core/errors/ErrorModel.dart';
import 'package:tecpatient/core/models/appointments_model.dart';
import 'package:tecpatient/core/utils/app_strings.dart';
import 'package:http/http.dart' as http;

class BookingRemoteDataSource {
  Future<bool> postAppointment({
    required String AppId,
    required int HospId,
    required int patientId,
    required String date,
    required String time,
    required String Specialization,
  }) async {
    try {
      print("appId: $AppId");
      print("patientId: $patientId");

      final response = await http.post(Uri.parse(AppStrings.apiAppointments),
          body: jsonEncode({
            "data": {
              "AppointmentID": "A$AppId",
              "patient": patientId,
              "Specialization": Specialization,
              "date": date,
              "time": time,
              "hospital": HospId
            }
          }),
          headers: {
            "Content-Type": "application/json",
            'Accept': '*/*',
          });
      print("after response");
      if (response.statusCode == 200) {
        print("Success post Medical Record");
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          // Assuming ConsultantModel.fromJson method parses a single JSON object
          // print("Consultants: ${consultants.data?[0].attributes!.name}");

          return true;
        } else {
          print("Error in Success signup Consultants");
          print(data);
        }
        // print(response.body);
      } else {
        print("Error in post Medical Record");
        print(response.body);
        final jsonResponse = jsonDecode(response.body);
        ErrorMessageModel.fromJson(jsonResponse);
        print(response.body);
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
    return false;
  }

  Future<bool> checkAppointmentId(String id) async {
    try {
      final response = await http.get(Uri.parse(AppStrings.apiAppointments +
          AppStrings.apiAppointmentsFilterReg +
          "A$id"));
      if (response.statusCode == 200) {
        print("Success check Appointment ID");
        final data = jsonDecode(response.body);
// consultants.data?[0].attributes!.name
        if (data is Map<String, dynamic>) {
          // Assuming ConsultantModel.fromJson method parses a single JSON object
          AppointmentsModel appointments = AppointmentsModel.fromJson(data);
          print(
              "Appointment: ${appointments.data?[0].attributes!.appointmentId}");
          if (appointments.data!.isEmpty) {
            return false;
          } else {
            return true;
          }
        } else {
          print("Error in Success a ID");
        }
        print(response.body);
      } else {
        print("Error in check Med Rec ID");
        final jsonResponse = jsonDecode(response.body);
        ErrorMessageModel.fromJson(jsonResponse);
        print(response.body);
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
    return false;
  }
}
