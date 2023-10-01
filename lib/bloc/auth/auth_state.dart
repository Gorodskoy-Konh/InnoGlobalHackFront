part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthTokenSaved extends AuthState {
  final String token;

  AuthTokenSaved({required this.token});
}

class AuthTokenOrganizationSaved extends AuthTokenSaved {
  final String organizationId;

  AuthTokenOrganizationSaved({
    required super.token,
    required this.organizationId,
  });
}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String? message;

  AuthError([this.message]);
}
