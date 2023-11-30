import 'dart:io';

import 'package:app_petfind/src/helpers/config_forms/user_register/structure.dart';
import 'package:app_petfind/src/helpers/functions/inputs.dart';
import 'package:app_petfind/src/screens/select_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  String selectedCountryCode = '+57';
  bool termsAndConditionsAccepted = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  XFile? _imageFile;
  late LatLng _selectedLocation;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> _openSelectLocation() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPickerScreen(),
      ),
    );

    if (result != null && result is LatLng) {
      setState(() {
        _selectedLocation = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/logo.png', width: 80, height: 80),
                Text(
                  'Registro',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Bienvenido, por favor regístrate'),

                createTextInput(username(_usernameController)),
                createTextInput(name(_nameController)),
                createTextInput(email(_emailController)),
                createTextInput(password(_passwordController)),
                createTextInput(password(_confirmPasswordController)),
                createTextInput(phoneNumber(_phoneNumberController)),

                // Botón para cargar imagen de perfil
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Cargar imagen de perfil'),
                ),
                Center(
                  child: _imageFile == null
                      ? Text('No image selected.')
                      : Image.file(
                          File(_imageFile!.path),
                          height: 200.0,
                          width: 200.0,
                        ),
                ),

                // Botón para cargar el mapa y obtener la ubicación
                ElevatedButton(
                  onPressed: _openSelectLocation,
                  child: Text('Cargar mapa para ubicación'),
                ),

                // Checkbox para aceptar términos y condiciones
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: termsAndConditionsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          termsAndConditionsAccepted = value!;
                        });
                      },
                    ),
                    Text('Acepto los términos y condiciones'),
                  ],
                ),

                // Botón de registro
                ElevatedButton(
                  onPressed: _saveUser,
                  child: Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveUser() async {
    if (_formKey.currentState!.validate()) {
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
}
