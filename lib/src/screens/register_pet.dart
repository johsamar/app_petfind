import 'package:app_petfind/src/helpers/config_forms/register_pet/structure.dart';
import 'package:app_petfind/src/helpers/functions/inputs.dart';
import 'package:app_petfind/src/screens/charge_images.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/material.dart';

class RegisterPetScreen extends StatefulWidget {
  @override
  _RegisterPetScreenState createState() => _RegisterPetScreenState();
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

  String selectedCountryCode = '+57';
  bool termsAndConditionsAccepted = false;

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

  List<Asset> _selectedImages = [];
  Future<void> _openImagePickerScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagePickerScreen(),
      ),
    );

    if (result != null && result is List<Asset>) {
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
                        .map((asset) => Text(asset.name!))
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

      // var response = createLot(lote);

      // response.then((value) => {
      //       //Si es verdadero se muestra el mensaje de éxito y vuleve la pantalla anterior
      //       if (value == true)
      //         {
      //           // _isLoading = false,
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             const SnackBar(content: Text('Lote creado con éxito')),
      //           ),
      //           Navigator.pushReplacementNamed(context, '/lots')
      //         }

      //       //Si es falso se muestra el mensaje de error
      //       else
      //         {
      //           // _isLoading = false,
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             const SnackBar(content: Text('Error al crear el lote')),
      //           )
      //         }
      //     });
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
}
