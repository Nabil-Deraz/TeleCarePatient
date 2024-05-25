import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tecpatient/Features/home/data/remotedatasource.dart';
import 'package:tecpatient/core/models/PatientModel.dart';

part 'patient_name_state.dart';

class PatientNameCubit extends Cubit<PatientNameState> {
  PatientNameCubit() : super(PatientNameInitial());
  HomeRemoteDataSource remoteDataSource = HomeRemoteDataSource();

  void getPatientsID(String id) async {
    emit(PatientNameLoading());
    final patientinfo = await remoteDataSource.getPatientsID(id);

    if (patientinfo.data!.isNotEmpty) {
      emit(PatientNameSuccess(patientModel: patientinfo));
    } else {
      emit(PatientNameFailure(errorMessage: 'No Patient data'));
    }
  }
}
