import 'package:app_petfind/src/models/ReportModel.dart';
import 'package:app_petfind/src/utils/constants.dart';
import 'package:dio/dio.dart';
import 'dart:io';

final dio = Dio();

Future<bool> createReport(ReportModel report) async {
  try {

    FormData formData = FormData.fromMap({
      'user': report.user,
      'pet_id': report.pet_id,
      'report_type': report.type,
      'date': report.date,
      'location': report.location,
    });

    Response response = await dio.post(
      '$baseUrl/reports/create',
      data: formData,
    );

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
  } catch (e) {
    print(e);
    return false;
  }
  return false;
}
