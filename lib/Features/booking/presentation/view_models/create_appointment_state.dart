part of 'create_appointment_cubit.dart';

sealed class CreateAppointmentState {}

final class CreateAppointmentInitial extends CreateAppointmentState {}

final class CreateAppointmentLoading extends CreateAppointmentState {}

final class CreateAppointmentSuccess extends CreateAppointmentState {}

final class CreateAppointmentFailure extends CreateAppointmentState {
  final String message;

  CreateAppointmentFailure(this.message);
}

final class CreateAppointmentSelected extends CreateAppointmentState {
  final int currentIndex;
  final bool isSelected;

  CreateAppointmentSelected(this.currentIndex, this.isSelected);
}

final class CreateAppointmentChangeFormat extends CreateAppointmentState {
  final String message;

  CreateAppointmentChangeFormat(this.message);
}
