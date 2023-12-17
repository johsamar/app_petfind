import 'dart:convert';
import 'dart:typed_data';
import 'package:app_petfind/src/models/PetModel.dart';
import 'package:app_petfind/src/utils/constants.dart';
import 'package:dio/dio.dart';
import 'dart:io';
// import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:app_petfind/src/models/UserModel.dart';



final dio = Dio();

 Future<List<PetModel>> _fetchPets() async {
    final dio = Dio();
    final response = await dio.get('https://tu-endpoint-de-mascotas.com');

    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;
      return responseData.map((data) => PetModel.fromJson(data)).toList();
    } else {
      throw Exception('Error al cargar las mascotas');
    }
  }

// Future<bool> createPet(PetModel pet, List<Asset> images) async {
//   try {

//     List<MultipartFile> files = [];

//     for (Asset asset in images) {
//         ByteData byteData = await asset.getByteData();
//         List<int> imageData = byteData.buffer.asUint8List();

//         MultipartFile file = MultipartFile.fromBytes(
//           imageData,
//           filename: asset.name ?? 'image.jpg',
//         );
//         files.add(file);
//     }

//     FormData formData = FormData.fromMap({
//       'files': files,
//       'name': pet.name,
//       'details': pet.details,
//       'breed': pet.breed,
//       'specie': pet.specie,
//       'color': pet.color,
//       'size': pet.size,
//       'age': pet.age,
//       'owner': pet.owner,
//     });
    
//     Response response = await dio.post(
//       '$baseUrl/auth/register_pet',
//       data: formData,
//     );

//     if (response.statusCode == HttpStatus.ok) {
//       return true;
//     }
//   } catch (e) {
//     print(e);
//     return false;
//   }
//   return false;
// }
