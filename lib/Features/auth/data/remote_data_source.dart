import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tecpatient/core/errors/ErrorModel.dart';
import 'package:tecpatient/core/models/PatientModel.dart';
import 'package:tecpatient/core/utils/app_strings.dart';
import 'package:tecpatient/core/utils/functions/alert.dart';
import 'package:tecpatient/core/utils/security_manager.dart';

class AuthRemoteDataSource {
  Future<PatientModel> loginPatients(
      String regNum, String password, BuildContext context) async {
    PatientModel patients = PatientModel();

    try {
      print('print before response');
      final response =
          await http.get(Uri.parse(AppStrings.apiPatientsFilterID + regNum));
      print('print after response');
      if (response.statusCode == 200) {
        print("Success login Patient");
        final data = jsonDecode(response.body);
        // print(data);
        if (data is Map<String, dynamic>) {
          // Assuming ConsultantModel.fromJson method parses a single JSON object
          patients = PatientModel.fromJson(data);
          print("hereee");
          print("Patient: ${patients.data?[0].attributes!.name ?? "nothing"}");
          if (SecurityManager.comparePasswords(
            password,
            patients.data![0].attributes!.password!,
          )) {
            showAlert(
                title: "Perfecto",
                message: "Signed in Successfully",
                context: context);
          } else {
            showAlert(
                title: "Error",
                message: "Your Password is Incorrect",
                context: context);
          }
        } else {
          print("Error in Success login Patients");
        }
        print(response.body);
      } else {
        print("Error in login Patients");
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
        print(e.toString());
      }
    }
    return patients;
  }

  Future<bool> signupPatients(
      {required String regNum,
      required String name,
      required String phone,
      required String email,
      required String password,
      required String natid,
      required String governorate,
      required String birthdate,
      required BuildContext context}) async {
    try {
      print("regNum: $regNum");
      print("name: $name");
      print("phone: $phone");
      print("email: $email");
      print("password: $password");
      print("natid: $natid");
      print("governorate: $governorate");
      print("Birthdate: $birthdate");

      final response = await http.post(Uri.parse(AppStrings.apiPatient),
          body: jsonEncode({
            "data": {
              "reg_Num": "P$regNum",
              "Name": name,
              "phone": phone,
              "Email": email,
              "Governorate": governorate,
              "Password": password,
              "NationalId": natid,
              "Birth_Date": birthdate,
              "Gender": 'Male'
            }
          }),
          headers: {
            "Content-Type": "application/json",
            'Accept': '*/*',
          });
      if (response.statusCode == 200) {
        print("Success signup Patient");
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          // Assuming ConsultantModel.fromJson method parses a single JSON object
          // print("Consultants: ${consultants.data?[0].attributes!.name}");

          return true;
        } else {
          print("Error in Success signup Patients");
        }
        print(response.body);
      } else {
        print("Error in signup Patients");
        final jsonResponse = jsonDecode(response.body);
        print("jsonResponse: $jsonResponse");
        ErrorMessageModel.fromJson(jsonResponse);
        print(response.body);
        showAlert(
            title: "Error",
            message: "Your Registration Number is Incorrect",
            context: context);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
    return false;
  }

  Future<bool> checkPatientID(String id, bool isPatient) async {
    if (isPatient) {
      try {
        final response = await http.get(Uri.parse(
            AppStrings.apiPatient + AppStrings.apiPatientsFilterID + "P$id"));
        if (response.statusCode == 200) {
          print("Success check Patient ID");
          final data = jsonDecode(response.body);

          if (data is Map<String, dynamic>) {
            // Assuming ConsultantModel.fromJson method parses a single JSON object
            PatientModel Patients = PatientModel.fromJson(data);
            print("Patients: ${Patients.data?[0].attributes!.name}");
            if (Patients.data!.isEmpty) {
              return false;
            } else {
              return true;
            }
          } else {
            print("Error in Success check Consultant ID");
          }
          print(response.body);
        } else {
          print("Error in check Consultant ID");
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
    } else {
      try {
        final response = await http.get(Uri.parse(
            AppStrings.apiPatient + AppStrings.apiPatientsFilterID + "P$id"));
        if (response.statusCode == 200) {
          print("Success check Doctor ID");
          final data = jsonDecode(response.body);
          if (data is Map<String, dynamic>) {
            // Assuming ConsultantModel.fromJson method parses a single JSON object
            PatientModel patientModel = PatientModel.fromJson(data);
            print("Patient: ${patientModel.data?.isEmpty}");
            if (patientModel.data!.isEmpty) {
              return false;
            } else {
              return true;
            }
          } else {
            print("Error in Success check Doctor ID");
            return false;
          }
        } else {
          print("Error in check Doctor ID");
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
    }
    return false;
  }
}
