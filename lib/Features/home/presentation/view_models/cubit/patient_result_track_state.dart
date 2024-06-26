part of 'patient_result_track_cubit.dart';

@immutable
sealed class PatientResultTrackState {}

final class PatientResultTrackInitial extends PatientResultTrackState {}

final class PatientResultTrackLoading extends PatientResultTrackState {}

final class PatientResultTrackSuccess extends PatientResultTrackState {}

final class PatientResultTrackFailure extends PatientResultTrackState {
  final String errorMessage;

  PatientResultTrackFailure({required this.errorMessage});
}
