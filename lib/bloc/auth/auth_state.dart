part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccessful extends AuthState {
  final String token;

  AuthSuccessful({required this.token});
}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String? message;

  AuthError([this.message]);
}
