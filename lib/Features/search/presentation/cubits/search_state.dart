part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final HospitalModel hospitalModel;

  SearchLoaded(this.hospitalModel);
}

final class SearchFailed extends SearchState {
  final String msg;

  SearchFailed(this.msg);
}
