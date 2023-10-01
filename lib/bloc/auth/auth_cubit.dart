import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/data_sources/auth_data_source.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authDataSource) : super(AuthInitial());

  final AuthDataSource _authDataSource;

  Future<void> requestCode() async {
    try {
      _authDataSource.requestCode();
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> getToken(String code) async {
    try {
      final token = await _authDataSource.getToken(code);
      token != null
          ? emit(
              AuthTokenSaved(token: token),
            )
          : emit(
              AuthError('Token is null'),
            );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> sendTokenOrganizationId(String organizationId) async {
    switch (state) {
      case AuthTokenSaved state:
        try {
          await _authDataSource.sendTokenOrganizationId(
            state.token,
            organizationId,
          );
          emit(
            AuthTokenOrganizationSaved(
              token: state.token,
              organizationId: organizationId,
            ),
          );
        } catch (e) {
          print(e);
        }
      default:
        break;
    }
  }
}
