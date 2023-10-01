import 'package:dio/dio.dart';
import 'package:front/secrets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../url_consts.dart';

class AuthDataSource {
  late final Dio _dio;

  AuthDataSource() {
    _dio = Dio();
    _dio.interceptors.add(LogInterceptor());
  }

  Future<void> requestCode() async {
    try {
      await launchUrl(
        Uri.parse('$kBaseUrl$kAuthUrl?response_type=code&client_id=$kClientId'),
      );
    } on DioException catch (e, stackTrace) {
      print(e);
    }
  }

  Future<String?> getToken(String code) async {
    final data = {
      'grant_type': 'authorization_code',
      'code': code,
      'client_id': kClientId,
      'client_secret': kClientSecret,
    };
    try {
      final response = await _dio.post(
        '$kBaseUrl$kTokenUrl',
        data: FormData.fromMap(data),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );
      print(response.data);
      return response.data['access_token'];
    } on DioException catch (e) {
      print(e);
      print(e.response);
    }
  }

  Future<void> sendTokenOrganizationId(
      String token, String organizationId) async {
    // TODO - Implement
    await Future.delayed(
      const Duration(
        milliseconds: 10,
      ),
    );
  }
}
