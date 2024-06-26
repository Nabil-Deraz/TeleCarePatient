import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tecpatient/Features/Profile/data/remote_data_source.dart';
import 'package:tecpatient/core/models/PatientModel.dart';
import 'package:tecpatient/core/utils/security_manager.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ProfileRemoteDataSource _profileRemoteDataSource =
      ProfileRemoteDataSource();

  TextEditingController emailController = TextEditingController();
  bool emailReadOnly = true;
  TextEditingController phoneController = TextEditingController();
  bool phoneReadOnly = true;
  TextEditingController passController = TextEditingController();
  bool passReadOnly = true;
  TextEditingController addressController = TextEditingController();
  bool addressReadOnly = true;
  TextEditingController regNumController = TextEditingController();
  TextEditingController natIdController = TextEditingController();
  var pass = '';
  void getPatientInfo(String regNum) async {
    emit(ProfileLoading());
    try {
      PatientModel patientModel =
          await _profileRemoteDataSource.getPatientInfo(regNum);
      pass = patientModel.data?[0].attributes?.password ?? "no";
      emailController.value = emailController.value.copyWith(
          text: patientModel.data?[0].attributes?.email ?? "gggg@gmail.com");
      phoneController.value = phoneController.value.copyWith(
          text: patientModel.data?[0].attributes?.phone ?? "01xxxxxxxxx");
      // passController.value = passController.value.copyWith(
      // text:
      // "${consultantModel.data?[0].attributes?.password?.substring(0, 3)}xxxxxx");
      addressController.value = addressController.value.copyWith(
          text: patientModel.data?[0].attributes?.street ?? "No Address");
      regNumController.value = regNumController.value.copyWith(
          text: patientModel.data?[0].attributes?.regNum ?? "No RegNum");
      natIdController.value = natIdController.value.copyWith(
          text:
              patientModel.data?[0].attributes?.nationalId ?? "No NationalId");
      emit(ProfileLoaded(patientModel: patientModel));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  void editEmail() {
    emailReadOnly = !emailReadOnly;
    emit(ProfileLoaded());
  }

  void editPhone() {
    phoneReadOnly = !phoneReadOnly;
    emit(ProfileLoaded());
  }

  void editPass() {
    passReadOnly = !passReadOnly;
    emit(ProfileLoaded());
  }

  void editAddress() {
    addressReadOnly = !addressReadOnly;
    emit(ProfileLoaded());
  }

  void disposeData() {
    emailController.dispose();
    phoneController.dispose();
    passController.dispose();
    addressController.dispose();
  }

  void initialState() {
    // emailController.value = emailController.value.copyWith(text: "");
    // phoneController.value = phoneController.value.copyWith(text: "");
    // passController.value = passController.value.copyWith(text: "");
    // addressController.value = addressController.value.copyWith(text: "");
    // regNumController.value = regNumController.value.copyWith(text: "");
    // licenseNumController.value = licenseNumController.value.copyWith(text: "");
    // natIdController.value = natIdController.value.copyWith(text: "");
    emailReadOnly = true;
    phoneReadOnly = true;
    passReadOnly = true;
    addressReadOnly = true;
  }

  void updateDoctorProfileData(BuildContext context) async {
    emit(ProfileLoading());
    try {
      if (passController.text == '') {
        final response =
            await _profileRemoteDataSource.updatePatientProfileData(
                phoneController.text,
                emailController.text,
                pass,
                addressController.text,
                context);
        if (response) {
          emit(ProfileUpdateSuccessfully());
        }
      } else {
        final response =
            await _profileRemoteDataSource.updatePatientProfileData(
                phoneController.text,
                emailController.text,
                SecurityManager.hashPassword(passController.text),
                addressController.text,
                context);
        if (response) {
          emit(ProfileUpdateSuccessfully());
        }
      }
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
