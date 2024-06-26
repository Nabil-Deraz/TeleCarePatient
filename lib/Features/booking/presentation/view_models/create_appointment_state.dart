part of 'create_appointment_cubit.dart';

sealed class CreateAppointmentState {}

final class CreateAppointmentInitial extends CreateAppointmentState {}

final class CreateAppointmentLoading extends CreateAppointmentState {}

final class CreateAppointmentSuccess extends CreateAppointmentState {}

final class CreateAppointmentFailure extends CreateAppointmentState {
  final String message;

  CreateAppointmentFailure(this.message);
}
