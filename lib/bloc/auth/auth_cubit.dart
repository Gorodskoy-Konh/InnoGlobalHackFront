import 'package:bloc/bloc.dart';
import 'package:front/data_sources/auth_data_source.dart';
import 'package:meta/meta.dart';

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
              AuthSuccessful(token: token),
            )
          : emit(
              AuthError('Token is null'),
            );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
