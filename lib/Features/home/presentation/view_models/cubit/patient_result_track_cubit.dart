import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'patient_result_track_state.dart';

class PatientResultTrackCubit extends Cubit<PatientResultTrackState> {
  PatientResultTrackCubit() : super(PatientResultTrackInitial());
}
