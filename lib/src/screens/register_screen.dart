import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedCountryCode = '+57';
  bool termsAndConditionsAccepted = false;

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

          // Campos de entrada
          TextField(
            decoration: InputDecoration(labelText: 'Nombre de usuario'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Nombre'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Correo electrónico'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Confirmar contraseña'),
            obscureText: true,
          ),

          // Campo de selección de indicativo
          DropdownButtonFormField<String>(
            value: selectedCountryCode,
            onChanged: (String? newValue) {
              setState(() {
                selectedCountryCode = newValue!;
              });
            },
            items: <String>['+57', '+34'].map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),

          // Campo de entrada para el número de teléfono
          TextField(
            decoration: InputDecoration(labelText: 'Número de celular'),
          ),

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
