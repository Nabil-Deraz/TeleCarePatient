part of 'patient_appointment_cubit.dart';

@immutable
sealed class PatientAppointmentState {}

final class PatientAppointmentInitial extends PatientAppointmentState {}

final class PatientAppointmentLoading extends PatientAppointmentState {}

final class PatientAppointmentFailure extends PatientAppointmentState {
  final String errorMessage;

  PatientAppointmentFailure({required this.errorMessage});
}

final class PatientAppointmentSuccess extends PatientAppointmentState {
  final AppointmentsModel appointmentsModel;

  PatientAppointmentSuccess({required this.appointmentsModel});
}
