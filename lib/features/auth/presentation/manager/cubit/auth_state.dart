part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthTogglePassIcon extends AuthState {}

final class AuthSignOrSigbInLoadingState extends AuthState {}

final class AuthSignOrSigbInSuccessState extends AuthState {}

final class AuthSignOrSigbInFailureState extends AuthState {
  final String errorMessage;

  AuthSignOrSigbInFailureState({required this.errorMessage});
}
