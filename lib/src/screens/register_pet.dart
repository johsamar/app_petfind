import 'package:app_petfind/src/helpers/config_forms/register_pet/structure.dart';
import 'package:app_petfind/src/helpers/functions/inputs.dart';
import 'package:flutter/material.dart';

class RegisterPetScreen extends StatefulWidget {
  @override
  _RegisterPetScreenState createState() => _RegisterPetScreenState();
}

class _RegisterPetScreenState extends State<RegisterPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _detailController = TextEditingController();  

  String selectedCountryCode = '+57';
  bool termsAndConditionsAccepted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Image.asset('assets/images/logo.png', width: 80, height: 80),
          Text(
            'Registro',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('Bienvenido, por favor regístrate'),

          createTextInput(name(_nameController)),
          createTextInput(details(_detailController)),

          // Botón para cargar imagen de perfil
          ElevatedButton(
            onPressed: () {
              // Implementa la lógica para cargar una imagen de perfil
            },
            child: Text('Cargar imagen de perfil'),
          ),

          // Botón para cargar el mapa y obtener la ubicación
          ElevatedButton(
            onPressed: () {
              // Implementa la lógica para cargar el mapa y obtener la ubicación
            },
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
            onPressed: () {
              // Implementa la lógica de registro aquí
            },
            child: Text('Registrar'),
          ),
        ],
      ),
    );
  }
}
