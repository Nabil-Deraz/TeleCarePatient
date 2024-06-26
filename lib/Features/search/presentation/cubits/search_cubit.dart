import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecpatient/Features/search/data/remote_data_source.dart';
import 'package:tecpatient/core/models/hospitals_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController controller = TextEditingController();
  SearchRemoteDataSource searchRemoteDataSource = SearchRemoteDataSource();
  void searchHospitals(String name) async {
    emit(SearchLoading());
    final hospitals = await searchRemoteDataSource.searchHospitalWithName(name);
    if (hospitals.data!.isEmpty) {
      emit(SearchFailed('no hospitals founded'));
    } else {
      emit(SearchLoaded(hospitals));
    }
  }
}
