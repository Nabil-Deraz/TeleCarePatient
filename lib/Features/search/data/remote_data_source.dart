import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tecpatient/core/errors/ErrorModel.dart';
import 'package:tecpatient/core/models/hospitals_model.dart';
import 'package:tecpatient/core/utils/app_strings.dart';

class SearchRemoteDataSource {
  Future<HospitalModel> searchHospitalWithName(String name) async {
    HospitalModel hospitals = HospitalModel();

    try {
      final response =
          await http.get(Uri.parse(AppStrings.apiHospitalFilterName + name));

      if (response.statusCode == 200) {
        print("Success get hospitals with name");
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          // Assuming ConsultantModel.fromJson method parses a single JSON object
          hospitals = HospitalModel.fromJson(data);
          print("Hospitals: ${hospitals.data?[0]}");
        } else {
          print("Error in success Search Name Hospitals");
        }
        print(response.body);
      } else {
        print("Error in search Name Hospitals");
        final jsonResponse = jsonDecode(response.body);
        ErrorMessageModel.fromJson(jsonResponse);
        print(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return hospitals;
  }
}
