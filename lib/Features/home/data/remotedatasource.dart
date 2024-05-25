import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:tecpatient/core/models/PatientModel.dart';
import 'package:http/http.dart' as http;
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
}
