import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tecpatient/Features/auth/data/remote_data_source.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/models/PatientModel.dart';
import 'package:tecpatient/core/models/hospitals_model.dart';
import 'package:tecpatient/core/utils/functions/random_reg.dart';
import 'package:tecpatient/core/utils/security_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordSignController = TextEditingController();
  TextEditingController natidController = TextEditingController();
  String medicalSpecialtyValue = '';
  String governorate = '';
  String hospital = '';
  bool isPatient = false;
  TextEditingController regNumController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  void login(BuildContext ctx) async {
    emit(AuthLoading());

    PatientModel patient = await authRemoteDataSource.loginPatients(
        regNumController.text, passwordLoginController.text, ctx);
    if (patient.data!.isNotEmpty) {
      CacheHelper.saveData(
        key: "name",
        value: patient.data?[0].attributes!.name,
      );
      CacheHelper.saveData(
        key: "regNum",
        value: patient.data?[0].attributes!.regNum,
      );
      emit(LoginSuccess());
    } else {
      emit(LoginError("Error"));
    }
  }

  void signup(BuildContext ctx) async {
    emit(AuthLoading());
    String id = '';
    bool uniqueID = await authRemoteDataSource.checkPatientID(id, isPatient);
    do {
      id = generateRandomNumber().toString();
      print("id: $id");
      uniqueID = await authRemoteDataSource.checkPatientID(id, isPatient);
      print("hola from signup");
    } while (uniqueID);
    if (isPatient) {
      bool consultant = await authRemoteDataSource.signupPatients(
          id,
          nameController.text,
          phoneController.text,
          emailController.text,
          SecurityManager.hashPassword(passwordSignController.text),
          natidController.text,
          governorate,
          ctx);
      if (consultant) {
        emit(SignupSuccess());
      } else {
        emit(SignupError("Error"));
      }
    }
  }

  void dropDownMenuValue(bool isGov, String value) {
    if (isGov) {
      governorate = value;
      print(governorate);
    } else {
      medicalSpecialtyValue = value;
      print(medicalSpecialtyValue);
    }
  }

  void setHospital(String value) {
    hospital = value;
  }

  void initialState() {
    isPatient = false;
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordSignController.clear();
    natidController.clear();
    medicalSpecialtyValue = '';
    governorate = '';
    regNumController.clear();
    passwordLoginController.clear();

    emit(AuthInitial());
  }
}
