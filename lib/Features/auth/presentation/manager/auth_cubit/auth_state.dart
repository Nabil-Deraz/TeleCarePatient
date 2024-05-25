part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginError extends AuthState {
  final String message;
  LoginError(this.message);
}

final class SignupSuccess extends AuthState {}

final class SignupError extends AuthState {
  final String message;
  SignupError(this.message);
}

final class HospitlasLoading extends AuthState {}

final class HospitalsSuccess extends AuthState {
  final HospitalsModel hospitals;
  HospitalsSuccess(this.hospitals);
}

final class HospitalsError extends AuthState {
  final String message;
  HospitalsError(this.message);
}

final class GovernoratesSuccess extends AuthState {}

final class GovernoratesError extends AuthState {
  final String message;
  GovernoratesError(this.message);
}
