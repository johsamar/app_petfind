import 'dart:convert';
import 'package:app_petfind/src/utils/constants.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:app_petfind/src/models/UserModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final dio = Dio();

Future<bool> createUser(UserModel user, File image) async {
  try {
    String? token = await FirebaseMessaging.instance.getToken();
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
      'username': user.username,
      'name': user.name,
      'email': user.email,
      'cellphone': user.cellphone,
      'location': user.location,
      'password': user.password,
      'token': token,
    });

    print(formData.fields);

    Response response = await dio.post(
      '$baseUrl/auth/register',
      data: formData,
    );

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
  } catch (e) {
    return false;
  }
  return false;
}
