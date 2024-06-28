import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tecpatient/Features/home/data/remotedatasource.dart';
import 'package:tecpatient/core/models/medical_records_model.dart';

part 'patient_result_track_state.dart';

class PatientResultTrackCubit extends Cubit<PatientResultTrackState> {
  PatientResultTrackCubit() : super(PatientResultTrackInitial());

  HomeRemoteDataSource _homeRemoteDataSource = HomeRemoteDataSource();

  int activeStep = 1;
  void getTrackStep() async {
    emit(PatientResultTrackLoading());

    final MedicalRecordsModel response =
        await _homeRemoteDataSource.getMedicalRecords();
    if (response.data!.isNotEmpty) {
      emit(PatientResultTrackSuccess(medicalRecords: response));
    } else {
      emit(PatientResultTrackFailure(errorMessage: "No Data Found"));
    }
  }

  void changeStep(int step) {
    activeStep = step;
    // emit();
  }
}
