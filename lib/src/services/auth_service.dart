import 'package:app_petfind/src/utils/constants.dart';
import 'package:dio/dio.dart';
import 'dart:io';

final dio = Dio();

Future<String?> login(String username, String password) async {
  try {
    FormData formData = FormData.fromMap({
      'username': username,
      'password': password,
    });

    Response response = await dio.post(
      '$baseUrl/auth/login',
      data: formData,
    );

    if (response.statusCode == HttpStatus.ok) {
      return response.data['user'];
    }
  } catch (e) {
    print(e);
    return null;
  }
  return null;
}
