import 'package:app_petfind/src/models/PetModel.dart';
import 'package:app_petfind/src/utils/constants.dart';
import 'package:dio/dio.dart';
import 'dart:io';

final dio = Dio();

Future<List<PetModel>> getPets(String owner) async {
  final dio = Dio();
  final response = await dio.get('$baseUrl/pets/owner?owner=$owner');

  if (response.statusCode == 200) {
    final List<dynamic> responseData = response.data["pets"];
    return responseData.map((data) => PetModel.fromJson(data)).toList();
  } else {
    throw Exception('Error al cargar las mascotas');
  }
}

Future<bool> createPet(PetModel pet, List<File> images) async {
  try {
    List<MultipartFile> files = [];

    for (File image in images) {
      files.add(
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      );
    }

    FormData formData = FormData.fromMap({
      'files': files,
      'name': pet.name!,
      'details': pet.details,
      'breed': pet.breed,
      'specie': pet.specie,
      'color': pet.color,
      'size': pet.size,
      'age': pet.age,
      'owner': pet.owner,
    });

    Response response = await dio.post(
      '$baseUrl/pets/register',
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

Future<PetModel?> createPetSighting(PetModel pet, List<File> images) async {
  try {
    List<MultipartFile> files = [];

    for (File image in images) {
      files.add(
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      );
    }

    FormData formData = FormData.fromMap({
      'files': files,
      'details': pet.details,
      'breed': pet.breed,
      'specie': pet.specie,
      'color': pet.color,
      'size': pet.size,
      'age': pet.age,
      'reporter': pet.reporter,
    });

    Response response = await dio.post(
      '$baseUrl/pets/register-sighting',
      data: formData,
    );

    if (response.statusCode == HttpStatus.ok) {
      print(response.data);
      return PetModel.fromJson(response.data["pet"]);
    }
  } catch (e) {
    print(e);
    return null;
  }
  return null;
}
