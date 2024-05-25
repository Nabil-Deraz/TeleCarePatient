part of 'patient_name_cubit.dart';

@immutable
sealed class PatientNameState {}

final class PatientNameInitial extends PatientNameState {}
final class PatientNameLoading extends PatientNameState {}
final class PatientNameFailure extends PatientNameState {
  final String errorMessage;

  PatientNameFailure({required this.errorMessage});
}
final class PatientNameSuccess extends PatientNameState {
  final PatientModel patientModel;

  PatientNameSuccess({required this.patientModel});
}