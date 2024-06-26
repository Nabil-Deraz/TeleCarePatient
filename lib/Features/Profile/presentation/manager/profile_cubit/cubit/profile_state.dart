part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final PatientModel? patientModel;
  ProfileLoaded({this.patientModel});
}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

final class ProfileUpdateSuccessfully extends ProfileState {}

final class ProfileUpdateError extends ProfileState {
  final String message;

  ProfileUpdateError({required this.message});
}
