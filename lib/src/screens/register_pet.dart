import 'dart:io';

import 'package:app_petfind/src/helpers/config_forms/register_pet/structure.dart';
import 'package:app_petfind/src/helpers/functions/inputs.dart';
import 'package:app_petfind/src/models/PetModel.dart';
import 'package:app_petfind/src/screens/charge_images.dart';
import 'package:app_petfind/src/services/pet_service.dart';
import 'package:flutter/material.dart';

class RegisterPetScreen extends StatefulWidget {
  const RegisterPetScreen({super.key});

  @override
  State<RegisterPetScreen> createState() => _RegisterPetScreenState();
}

class _RegisterPetScreenState extends State<RegisterPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _detailController = TextEditingController();
  final _specieController = TextEditingController();
  final _breedController = TextEditingController();
  final _colorController = TextEditingController();
  final _sizeController = TextEditingController();
  final _ageController = TextEditingController();

  String? specieSelected;
  String? breedSelected;
  String? colorSelected;
  String? sizeSelected;
  String? ageSelected;

  @override
  void dispose() {
    _nameController.dispose();
    _detailController.dispose();
    _specieController.dispose();
    _breedController.dispose();
    _colorController.dispose();
    _sizeController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  List<File> _selectedImages = [];
  Future<void> _openImagePickerScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultipleImageSelector(),
      ),
    );

    if (result != null && result is List<File>) {
      setState(() {
        _selectedImages = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/logo.png', width: 80, height: 80),
                const Text(
                  'Registro',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text('Bienvenido, por favor regístrate'),

                createTextInput(name(_nameController)),
                createTextInput(details(_detailController)),

                createSelectInput(
                  specie(_specieController, specieSelected),
                  (String? value) {
                    setState(() {
                      specieSelected = value!;
                      _specieController.text = value;
                    });
                  },
                ),

                createSelectInput(
                  breed(_breedController, breedSelected, specieSelected),
                  (String? value) {
                    setState(() {
                      breedSelected = value!;
                      _breedController.text = value;
                    });
                  },
                ),

                createSelectInput(
                  color(_colorController, colorSelected),
                  (String? value) {
                    setState(() {
                      colorSelected = value!;
                      _colorController.text = value;
                    });
                  },
                ),

                createSelectInput(
                  size(_sizeController, sizeSelected),
                  (String? value) {
                    setState(() {
                      sizeSelected = value!;
                      _sizeController.text = value;
                    });
                  },
                ),

                createSelectInput(
                  age(_ageController, ageSelected),
                  (String? value) {
                    setState(() {
                      ageSelected = value!;
                      _ageController.text = value;
                    });
                  },
                ),

                // Botón para cargar imagen de perfil
                ElevatedButton(
                  onPressed: _openImagePickerScreen,
                  child: const Text('Cargar fotos de la mascota'),
                ),
                Column(
                    children: _selectedImages
                        .map((image) => Text(image.path.split("/").last))
                        .toList()),

                // Botón de registro
                ElevatedButton(
                  onPressed: _savePet,
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _savePet() async {
    if (_formKey.currentState!.validate()) {
      _validateSelects();
      // _isLoading = true;

      PetModel pet = PetModel(
        name: _nameController.text,
        details: _detailController.text,
        specie: _specieController.text,
        breed: _breedController.text,
        color: _colorController.text,
        size: _sizeController.text,
        age: _ageController.text,
        owner: '657f70180062fc8b9d98797c',
      );

      var response = createPet(pet, _selectedImages);

      response.then((value) => {
            //Si es verdadero se muestra el mensaje de éxito y vuleve la pantalla anterior
            if (value == true)
              {
                // _isLoading = false,
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mascota creado con éxito')),
                ),
                Navigator.pushReplacementNamed(context, '/chat')
              }

            //Si es falso se muestra el mensaje de error
            else
              {
                // _isLoading = false,
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error al crear la mascota')),
                )
              }
          });
    }
  }

  _validateSelects() {
    if (_specieController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleccione una especie')),
      );
      return;
    }
    if (_breedController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleccione una raza')),
      );
      return;
    }
    if (_colorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleccione un color')),
      );
      return;
    }
    if (_sizeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleccione un tamaño')),
      );
      return;
    }
    if (_ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleccione una edad')),
      );
      return;
    }
  }

  // Future<List<File>> convertAssetsToFiles(List<Asset> assets) async {
  //   List<File> files = [];

  //   for (Asset asset in assets) {
  //     ByteData byteData = await asset.getByteData();
  //     Uint8List uint8List = byteData.buffer.asUint8List();
  //     File file = File.fromRawPath(uint8List.buffer.asUint8List());
  //     files.add(file);
  //     //para ver el nombre del archivo y el path
  //     print('file: ${file.path} ');
  //   }

  //   return files;
  // }
}
