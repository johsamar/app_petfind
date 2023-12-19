import 'package:app_petfind/src/models/PetModel.dart';
import 'package:app_petfind/src/screens/reports/report_screen.dart';
import 'package:app_petfind/src/services/pet_service.dart';
import 'package:flutter/material.dart';

class ListMyPetsToReport extends StatefulWidget {
  const ListMyPetsToReport({Key? key}) : super(key: key);

  @override
  State<ListMyPetsToReport> createState() => _ListMyPetsToReportState();
}

class _ListMyPetsToReportState extends State<ListMyPetsToReport> {
  String owner = '657f70180062fc8b9d98797c';

  int? selectedPetIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Mascotas'),
      ),
      body: FutureBuilder(
        future: getPets(owner),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<PetModel> pets = snapshot.data as List<PetModel>;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: pets.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPetIndex = index;
                          });
                        },
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/pet_default/${pets[index].specie}.png',
                                ),
                                height: 50,
                                width: 50,
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  pets[index].name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Checkbox(
                                value: selectedPetIndex == index,
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedPetIndex = value! ? index : null;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: selectedPetIndex != null
                      ? () {
                          // Hacer algo con la mascota seleccionada
                          PetModel selectedPet = pets[selectedPetIndex!];
                          print('Mascota seleccionada: ${selectedPet.id}');
                          // ir a Reportar y enviar la mascota de parametro
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportScreen(
                                pet: selectedPet,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Text('Continuar'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
