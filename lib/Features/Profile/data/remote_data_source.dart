import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tecpatient/core/errors/ErrorModel.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/models/PatientModel.dart';
import 'package:tecpatient/core/utils/app_strings.dart';
import 'package:tecpatient/core/utils/functions/alert.dart';

class ProfileRemoteDataSource {
  Future<PatientModel> getPatientInfo(String regNum) async {
    PatientModel patientModel = PatientModel();
    try {
      print("regNum : $regNum");
      final response = await http.get(Uri.parse(
          AppStrings.apiPatient + AppStrings.apiPatientsFilterID + regNum));
      if (response.statusCode == 200) {
        print("Success get Doctors Data");
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          patientModel = PatientModel.fromJson(data);
          print("Patient Model: ${patientModel.data ?? "No Patient Name"}");

          print("Patients Data: ${patientModel.data?[0]}");
        } else {
          print("Error in Success get Doctor ");
        }
      } else {
        print("Error in get Doctors Data");
        // final jsonResponse = response.body;
        print(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return patientModel;
  }

  Future<bool> updatePatientProfileData(
      String phone,
      String email,
      String password,
      String address,
      // String? imgId,
      BuildContext context) async {
    try {
      final response = await http.put(
          Uri.parse(AppStrings.apiPatientUpload +
              CacheHelper.getData(key: 'Pid').toString()),
          body: jsonEncode({
            "data": {
              "phone": phone,
              "Email": email,
              "Password": password,
              "Address": address,
              // "doctor_Pic": imgId
            }
          }),
          headers: {
            "Content-Type": "application/json",
            'Accept': '*/*',
          });

      if (response.statusCode == 200) {
        print("Success signup Doctor");
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          showAlert(
              title: "Perfecto",
              message: "Your Data is Updated Successfully",
              context: context);
          return true;
        } else {
          print("Error in Success signup Doctor");
        }
        print(response.body);
      } else {
        print("Error in signup Doctor");
        final jsonResponse = jsonDecode(response.body);
        ErrorMessageModel.fromJson(jsonResponse);
        print(response.body);
        showAlert(
            title: "Error",
            message: "Your Registration Number is Incorrect",
            context: context);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in updateDoctorsProfileData");
        print(e.toString());
      }
    }
    return false;
  }

  Future<bool> checkDoctorConsultantId(
      String phone,
      String email,
      String password,
      String address,
      // String imgId,
      BuildContext context) async {
    return await updatePatientProfileData(
        phone, email, password, address, context);
  }
}
