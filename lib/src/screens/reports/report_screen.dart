import 'dart:io';

import 'package:app_petfind/src/helpers/config_forms/report/structure.dart';
import 'package:app_petfind/src/helpers/functions/inputs.dart';
import 'package:app_petfind/src/models/PetModel.dart';
import 'package:app_petfind/src/models/ReportModel.dart';
import 'package:app_petfind/src/providers/AuthProvider.dart';
import 'package:app_petfind/src/screens/select_location.dart';
import 'package:app_petfind/src/services/report_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  final PetModel pet;
  const ReportScreen({super.key, required this.pet});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();
  PetModel get pet => widget.pet;

  final _detailController = TextEditingController();

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  LatLng? _selectedLocation;

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
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportar Mascota'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  // informacion de la mascota

                  createTextInput(details(_detailController)),

                  ElevatedButton(
                    onPressed: _openSelectLocation,
                    child: Text('Cargar mapa para ubicación'),
                  ),

                  Center(
                      child: _selectedLocation == null
                          ? Text('No location selected.')
                          : Text(
                              'Ubicación seleccionada: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}')),

                  // Botón de registro
                  ElevatedButton(
                    onPressed: () => {
                      _saveReport(authProvider.userId!),
                    },
                    child: const Text('Registrar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveReport(String userId) async {
    if (_formKey.currentState!.validate()) {
      ReportModel reportModel = ReportModel(
          user: userId,
          pet_id: pet.id!,
          type: 'perdida',
          date: DateTime.now(),
          location: [
            _selectedLocation!.latitude,
            _selectedLocation!.longitude
          ]);
      print(reportModel.toJson());

      final response = await createReport(reportModel);
      if (response) {
        Navigator.pushNamed(context, '/chat');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al registrar el reporte'),
          ),
        );
      }
    }
  }
}
