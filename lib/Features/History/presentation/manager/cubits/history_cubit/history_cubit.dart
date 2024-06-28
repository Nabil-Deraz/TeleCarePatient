import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tecpatient/Features/History/data/remote_data_source.dart';
import 'package:tecpatient/core/models/medical_records_model.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());
  HistoryRemoteDataSource remoteDataSource = HistoryRemoteDataSource();

  void getMedicalRecords() async {
    emit(HistoryLoading());
    final medicalRecords = await remoteDataSource.getMedicalRecords();

    if (medicalRecords.data!.isNotEmpty) {
      emit(HistoryLoaded(medicalRecords));
    } else {
      emit(HistoryError('No History yet'));
    }
  }
}
