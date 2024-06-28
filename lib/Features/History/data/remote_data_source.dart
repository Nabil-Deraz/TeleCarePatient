import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tecpatient/core/errors/ErrorModel.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/models/medical_records_model.dart';
import 'package:tecpatient/core/utils/app_strings.dart';

class HistoryRemoteDataSource {
  Future<MedicalRecordsModel> getMedicalRecords() async {
    MedicalRecordsModel medicalRecords = MedicalRecordsModel();
    try {
      final response = await http.get(Uri.parse(
          AppStrings.apiMedicalRecordFilterID +
              CacheHelper.getData(key: 'regNum')));
      if (response.statusCode == 200) {
        print("Success get Medical Records");
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          // Assuming ConsultantModel.fromJson method parses a single JSON object
          medicalRecords = MedicalRecordsModel.fromJson(data);
          print("Medical Records: ${medicalRecords.data?[0]}");
        } else {
          print("Error in Success get Medical Records");
        }
        print(response.body);
      } else {
        print("Error in get Medical Records");
        final jsonResponse = jsonDecode(response.body);
        ErrorMessageModel.fromJson(jsonResponse);
        print(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return medicalRecords;
  }
}
