part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryLoaded extends HistoryState {
  final MedicalRecordsModel medicalRecords;

  HistoryLoaded(this.medicalRecords);
}

final class HistoryError extends HistoryState {
  final String message;

  HistoryError(this.message);
}
