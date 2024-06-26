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
  TextEditingController birthDateController = TextEditingController();
  String governorate = '';
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
      CacheHelper.saveData(
        key: "Pid",
        value: patient.data?[0].id,
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

    bool patient = await authRemoteDataSource.signupPatients(
        regNum: id,
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: SecurityManager.hashPassword(passwordSignController.text),
        natid: natidController.text,
        birthdate: birthDateController.text,
        governorate: governorate,
        context: ctx);
    if (patient) {
      emit(SignupSuccess());
    } else {
      emit(SignupError("Error"));
    }
  }

  void dropDownMenuValue(bool isGov, String value) {
    if (isGov) {
      governorate = value;
      print(governorate);
    }
  }

  void initialState() {
    isPatient = false;
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordSignController.clear();
    natidController.clear();
    birthDateController.clear();
    governorate = '';
    regNumController.clear();
    passwordLoginController.clear();

    emit(AuthInitial());
  }

  Future<void> selectedDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );

    if (_picked != null) {
      birthDateController.text = _picked.toString().split(" ")[0];
      emit(BirthDatePickedSuccess());
    }
  }
}
